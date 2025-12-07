#import "../view/header.typ" as _view

#let visible-range(active-idx, widths, max-width, overlap, gap) = {
  let start = 0
  let len = widths.len()

  assert(
    active-idx >= start and active-idx < len, 
    message: "paged-overlap: active-idx " + str(active-idx) + " is out of bounds for list of size " + str(len) + "."
  )

  while start < len {
    let current-width = 0pt
    let end = start 

    while end < len {
      let width = widths.at(end) + if end > start { gap } else { 0pt }

      if current-width + width <= max-width {
        current-width += width
        end += 1
      } else { break }
    }    

    // Ensure at least one item is included, even if it 
    // exceeds max-width. This prevents infinite loops.
    if end == start { end += 1 } 

    if active-idx >= start and active-idx < end {
      return (start: start, end: end)
    } 
    
    start = calc.max(start + 1, end - overlap)
  }
}

#let _build(ctx) = {
  if ctx.sections.active == none { return none }

  let active-section-idx = ctx.sections.active.idx
  let title-widths = ctx.sections.final.titles.map(title => {
    if title == ctx.sections.final.titles.at(active-section-idx) {
      _view.text-width(title, ctx.config.style.header.section-title + ctx.config.style.header.active-title)
    } else {
      _view.text-width(title, ctx.config.style.header.section-title)
    }
  })
  
  let beads = title-widths.zip(ctx.frames.final.distr).map(
    zip => {
      let title-width = zip.at(0)
      let beads-count = zip.at(1)
      _view.arrange-beads(
        title-width, 
        beads-count, 
        ctx.config.layout.header.beads + ctx.config.style.header.beads)
    }
  )

  let section-widths = title-widths.zip(beads.map(it => it.width)).map(zip => {
    let title-width = zip.at(0)
    let beads-width = zip.at(1)
    return calc.max(title-width, beads-width)
  })

  let paging-algorithm = visible-range
  let (start, end) = paging-algorithm(
    active-section-idx,
    section-widths,
    ctx.config.layout.frame.paper.width - (
      ctx.config.layout.header.inset.left + ctx.config.layout.header.inset.right
    ),
    ctx.config.layout.header.paging.args.overlap,
    ctx.config.layout.header.paging.args.gap,
  )
  
  let header = (
    sections: (
      active-idx: active-section-idx,
      titles: ctx.sections.final.titles.slice(start, end),
      widths: section-widths,
      beads: beads.slice(start, end),
    ),
    frames: (
      active-idx: ctx.frames.active.idx,
      distr: ctx.frames.final.distr,
    )
  )

  _view.render(header, ctx.config.layout.header + ctx.config.style.header)
}

#let create(ctx) = _build(ctx)
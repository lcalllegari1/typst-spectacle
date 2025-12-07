#let text-width(item, style) = measure(text(..style, item)).width

#let arrange-beads(title-width, count, config) = {
  if count == 0 { return (rows: 0, beads-per-row: 0, width: 0pt) }

  let max-beads-per-row = calc.floor(
    title-width / (config.size.outer + config.spacing.horizontal)
  )

  let beads-per-row = calc.max(
    config.min-per-row,
    max-beads-per-row,
  )

  let rows = calc.ceil(count / beads-per-row)

  if config.distribute-evenly {
    beads-per-row = calc.floor(count / rows)
  }

  if rows > config.max-rows {
    rows = config.max-rows
    beads-per-row = calc.ceil(count / rows)
  }

  let width = beads-per-row * (config.size.outer) + (beads-per-row - 1) * config.spacing.horizontal

  return (rows: rows, beads-per-row: beads-per-row, width: width)
}

#let _render-beads(rows, beads-per-row, count) = {

}

#let render(header, config) = {
  let titles = ()
  let indicators = ()
  for i in range(header.sections.titles.len()) {
    titles.push(if i == header.sections.active-idx {
      text(..(config.section-title + config.active-title) , header.sections.titles.at(i))
    } else {
      text(..config.section-title, header.sections.titles.at(i))
    })
    indicators.push(if i == header.sections.active-idx {
      line(length: header.sections.widths.at(i), stroke: config.active-indicator.stroke)
    } else {
      line(length: header.sections.widths.at(i), stroke: 0pt)
    })
  }
  
  
  grid(
    columns: header.sections.titles.len(),
    rows: 3,
    row-gutter: 10pt,
    column-gutter: config.section-spacing,
    align: center,
    ..indicators,
    ..titles,
  )
  
}
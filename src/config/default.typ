#let paper = (
  str: "presentation-16-9",
  width: 841.89pt,
  height: 595.28pt,
)

#let nav-height = 50pt
#let title-height = 40pt

#let header-height = nav-height + title-height
#let footer-height = 30pt

#let layout = {
  (
    frame: (
      paper: paper,
      margin: (top: header-height, bottom: footer-height, left: 0pt, right: 0pt),
      header-ascent: 0%,
      footer-descent: 0%,
      nav-height: nav-height,
      title-height: title-height,
      header-height: header-height,
      footer-height: footer-height,
    ),
    header: (
      inset: (left: 10pt, top: 0pt, bottom: 10pt, right: 10pt),
      section-spacing: 15pt,
      beads: (
        min-per-row: 3,
        max-rows: 3,
        distribute-evenly: true,
      ),
      paging: (
        args: (
          overlap: 1,
          gap: 15pt,
        )
      )
    )
  )
}

#let style = {
  (
    frame: (
      fill: white,
    ),
    header: (
      section-title: (
        size: 20pt,
      ),
      active-title: (
        weight: "bold",
      ),
      active-indicator: (
        stroke: 5pt,
      ),
      beads: (
        size: (
          outer: 12pt,
          empty: 10pt,
          full: 10pt,
          active: 14pt,
        ),
        spacing: (
          horizontal: 3pt,
          vertical: 3pt,
        ),
        align: left,
      ),
    )
  )
}

#let base = {
  (
    layout: layout,
    style: style,
  )
}
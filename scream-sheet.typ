#let setup(
  doc
) = {
  set page(
    paper: "a4",
    // numbering: "- 1 of 1 -",
    margin: (
      top: 0em,
      bottom: 0em,
      x: 0em,
    )
  )
  set text(font: "lexend")
  // heading style
  rect(width:100%)[#grid(columns:3*(1fr,), // top most
  [#align(left,[a])],
  [#align(center,[b])],
  [#align(right,[c])])]
  v(0pt,weak: true)
  // selection header
  let switch = (
    8*([#rect(width:100%, height:100%, fill:black)[#align(center+horizon,text(fill:white,"test"))] #place(top+left,
    polygon(fill:white, (0em, 1em), (0em, 0em), (1em,  0em),))],)
  )
  rect(width:100%)[
    #box(grid(columns:5*(1fr,), rows:2*(2em,), gutter: 0.5em,
    grid.cell(rowspan: 2)[#square()],
    [#switch.at(0)],
    [#switch.at(1)],
    [#switch.at(2)],
    [#switch.at(3)],
    [#switch.at(4)],
    [#switch.at(5)],
    [#switch.at(6)],
    [#switch.at(7)],
    ))
  ]
  doc
}
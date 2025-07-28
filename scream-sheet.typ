#let setup(
  selected: 0,
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
  set par(justify: true)
  set text(font: "Lexend", size:10pt)

  show heading.where(level:1): it => block(width:100%, stroke: 0pt)[
    #{
    set par(justify:false)
    set text(size:12pt)
    let title = it.body.text.split("/")
    line(length:100%, stroke: (paint: black, thickness:1pt, dash: "dotted"))
    align(center, strong(title.at(0)))
    v(.5em,weak:true)
    block(fill:luma(85%), width:100%, inset:.2em)[#align(center,text(size:8pt, weight: "regular")[by #title.at(1)])]
    }
  ]

  let l(content) = {
    text(blue)[#content]
  }

  // heading style
  rect(width:100%)[#grid(columns:3*(1fr,), // top most
  [#align(left,[a])],
  [#align(center,[3:56 PM])],
  [#align(right,[c])])]
  v(0pt,weak: true)

  // selection header
  let button(label, num) = {
    let sel = white
    if num == selected{
      sel = red
    } else {
      sel = black
    }
    rect(width:100%, height:100%, fill:sel)[
      #align(center+horizon,strong(text(fill:white,label)))
    ]
    place(top+left,
      polygon(fill:white, (0em, 1em), (0em, 0em), (1em,  0em),)
    )
  }
  rect(width:100%)[
    #box(grid(columns:6*(1fr,), rows:2*(3em,), gutter: 0.5em,
    grid.cell(rowspan: 2, colspan: 2,align:center)[#image("NCT_NEWS_logo.svg")],
    [#button("GOSSIP", 0)],
    [#button("OPINION", 1)],
    [#button("WEATHER", 2)],
    [#button("TECH", 3)],
    [#button("LIFESTYLE", 4)],
    [#button("LOCAL", 5)],
    [#button("BUSINESS", 6)],
    [#button("WORLD", 7)],
    ))
  ]
  block(inset:(x:5em))[#columns()[#doc]]
}

#let l(content)={
  [\ ]
  text(blue)[*Link*: #content]
}
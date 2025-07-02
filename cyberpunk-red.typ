#let setup(
  colour: rgb(220,0,0),
  doc,
) = {
  set page(
    paper: "a4",
    numbering: "- 1 of 1 -",
    margin: (
      top: 5em,
      bottom: 3em,
      x: 4em,
    )
  )
  set text(font: "lexend")
set heading(numbering: "1.a")

show heading.where(level: 1): it => block[
  #let headFirst = upper(it.body.text.first())
  #let headRest = upper(it.body.text.slice(1))
  #let hpl = text(size:55pt)[#headFirst]
  #grid(rows:(1em, 1.5em), columns:(auto, 1fr),[#place(hpl)#hpl],[#text(size:1.4em,headRest)],grid.cell(colspan:2,fill:colour,[#align(right,square(fill:black))]))
]

show heading.where(level: 2): it => block[
  #let headFirst = upper(it.body.text.first())
  #let headRest = upper(it.body.text.slice(1))
  #block()[#text(size:20pt,headFirst)#text(size:15pt, headRest)
  #v(4pt, weak:true)
  #line(length:100%, stroke:colour+3pt)
  #place(bottom+right,dy:5pt,square(width:10pt,fill:colour))
  ]
]
show heading.where(level: 3): it => block(width:100%)[
  #let tri = polygon.regular(fill:colour, size:1.5em)
  #align(center,block(height:2em)[#box(rotate(-30deg,tri))
  #h(.25em)#text(size:14pt,it.body)#h(.25em)
  #box(rotate(30deg,tri))])
]
show outline.entry.where(
  level: 1
): set block(above: 1.2em)
set list(indent: 1em, marker: ([•],[∘]))
set enum(indent: 1em, numbering: "1.a.")
set par(
  justify: true,
  first-line-indent: 1em
)
set terms(separator: [:#h(0.6em, weak:true)])
show math.equation: set text(font:"Cambria Math")
show table.cell.where(y:0): set text(style: "normal", weight: "bold")
// show regex("(?m)^[^\\[]"): set text(red)
doc
}

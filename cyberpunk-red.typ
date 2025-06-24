
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

set heading(numbering: "1.a")

show heading.where(level: 1): it => block(width:100%)[
  // #set text(size:1em,weight: "regular")
  #rect(width: 100%, fill: colour)
  #show regex("(?m)^[^\\[]"): set text(red)
  #it

]

show heading.where(level: 2): it => block[
  #set align(left)
  #set text(size:14pt, weight: "regular")
  #(it.body)
]
show heading.where(level: 3): it => block[
  #set align(left)
  #set text(size:12.5pt, weight: "regular", fill: rgb(colourC))
  #emph(it.body)
  // #v(.65em, weak: true)
]
show outline.entry.where(
  level: 1
): set block(above: 1.2em)
set list(indent: 1em, marker: ([•],[∘]))
set enum(indent: 1em, numbering: "1.a.")
set par(
  // justify: true,
)
set terms(separator: [:#h(0.6em, weak:true)])
show math.equation: set text(font:"Cambria Math")
show table.cell.where(y:0): set text(style: "normal", weight: "bold")
show regex("(?m)^[^\\[]"): set text(red)
doc
}
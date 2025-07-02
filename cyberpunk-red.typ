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

show heading.where(level: 1): it => block(width:100%)[
  // #rect(width: 100%, fill: colour)
  #let headFirst = upper(it.body.text.first())
  #let headRest = upper(it.body.text.slice(1))
  #let placeHeadFirst = text(3em)[#headFirst]
  // #text(red)[#headFirst]#headRest
  // #rect(width: 100%, fill: colour, inset:0pt)[#headRest#v(0pt)#rect(width:100%, fill:green, inset: 0pt,height: 1em)[#place(bottom, placeHeadFirst)]]
  // #layout(size=>{
  //   let size = size.width
  // [#grid(columns: (auto,1fr), column-gutter: 0pt, inset: 0pt,
  // grid.cell(rowspan: 2)[#placeHeadFirst],[#headRest],[#align(bottom)[#place(top+left,dx:-2.5em,rect(width:size)[9])]])]})
  #block()[
  #grid(columns: (auto,1fr), column-gutter: 0pt, inset: 0pt,
  grid.cell(rowspan: 2)[#placeHeadFirst],[#headRest],
  [
    #let hWidth = measure(placeHeadFirst)
    #place(right+horizon,rect(fill:colour, width: 100%+hWidth.width)[#text("")])
    #align(right,rect(width:1.2em,fill: black)[""])
  ])
  
  #place(top+left,grid(columns: (auto,1fr), column-gutter: 0pt, inset: 0pt,
  grid.cell()[#(placeHeadFirst)],[#headRest]))
  ]
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
// show regex("(?m)^[^\\[]"): set text(red)
doc
}

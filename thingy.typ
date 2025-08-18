#set page(flipped: true)
#grid(
  columns: 5*(1fr,), rows: 3*(1fr,), gutter: 1em,
  grid.cell(rowspan: 2)[#rect(width: 100%, height: 100%, radius: 10pt,fill:red)[FILL TEXT HERE]],
  grid.cell(rowspan: 1)[#rect(width: 100%, height: 100%, radius: 10pt,fill:red)[FILL TEXT HERE]],
  grid.cell(rowspan: 2)[#rect(width: 100%, height: 100%, radius: 10pt,fill:red)[FILL TEXT HERE]],
  grid.cell(rowspan: 1)[#rect(width: 100%, height: 100%, radius: 10pt,fill:red)[FILL TEXT HERE]],
  grid.cell(rowspan: 2)[#rect(width: 100%, height: 100%, radius: 10pt,fill:red)[FILL TEXT HERE]],
  grid.cell(rowspan: 1)[#rect(width: 100%, height: 100%, radius: 10pt,fill:red)[FILL TEXT HERE]],
  grid.cell(rowspan: 1)[#rect(width: 100%, height: 100%, radius: 10pt,fill:red)[FILL TEXT HERE]],
  grid.cell(colspan:5, fill:white)[#grid(
  columns: 2*(1fr,), rows: 100%, gutter: 1em,
  [#rect(width: 100%, height: 100%, radius: 10pt,fill:red)[FILL TEXT HERE]],
  [#rect(width: 100%, height: 100%, radius: 10pt,fill:red)[FILL TEXT HERE]]

)]
)
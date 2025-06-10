#import "@preview/cades:0.3.0": qr-code
#set page(margin: 1em, fill: black, paper: "a4", columns: 2, flipped: true)
#let num_dots = 28.6  
#let page_width = layout(size => {
  let width = size.width
  [#(width)]
})
#let page_width = 573.2755905511811pt

#let dotting = tiling(
  size: ((page_width/num_dots),(page_width/num_dots)),
  spacing: (0pt, 0pt),
  relative: "self",
  place(circle(radius: 1pt, fill: luma(220))),
)
#let bottom_line = [
  #let colour = luma(220)
  #grid(columns:7*(1fr,),
  circle(stroke: colour, radius: 8pt)[],
  circle(stroke: colour, radius: 7pt)[],
  circle(stroke: colour, radius: 7pt)[],
  circle(stroke: colour, radius: 7pt)[],
  circle(stroke: colour, radius: 7pt)[],
  circle(stroke: colour, radius: 7pt)[],
  circle(stroke: colour, radius: 7pt)[],
  
  
  
  )
]
#let main_page() = {
 block(width: 100%, height: 100%)[#place(rect(fill:white, width: 100%, height: 100%)[
  #place(rect(fill:dotting, width: 100%, height: 100%)[])
  #place(bottom + center,dx:2pt,rect(width:100%, height: 3em, fill:white))
  #place(bottom + center,dx:2pt,rect(width:100%-9.5em, height: 3em, fill:white)[#align(center+horizon)[#bottom_line]])
  #place(bottom,qr-code("P01 V0I S0000000", width: 3.5em))
  ])
 ]
}
#place(top+left,image("Image (3).png"))
#main_page()
#main_page()
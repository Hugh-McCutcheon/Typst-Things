#import "@preview/cades:0.3.0": qr-code
#import "@preview/bookletic:0.3.0"

#set page(margin: 1em, fill: black, paper: "a4", columns: 1, flipped: true)
#set circle(inset: 0pt)
#let num_dots = 30
#let page_width = layout(size => {
  let width = size.width
  [#(width)]
})
#let page_width = 573.2755905511811pt

#let dotting = tiling(
  size: ((page_width/num_dots),(page_width/num_dots)),
  spacing: (0pt, 0pt),
  relative: "self",
  place(circle(radius: 1pt, fill: luma(80%))),
)
#let bottom_line = [
  #let colour = luma(80%)
  #grid(columns:7*(1fr,),
  circle(stroke: colour, radius: 8pt)[#image("sym/controller-svgrepo-com.svg", width: 120%)],
  circle(stroke: colour, radius: 8pt)[#image("sym/book-svgrepo-com.svg", width: 110%)],
  circle(stroke: colour, radius: 8pt)[#image("sym/house-window-svgrepo-com.svg", width: 119%)],
  circle(stroke: colour, radius: 8pt)[#image("sym/graduation-hat-alt-2-svgrepo-com.svg", width: 124%)],
  circle(stroke: colour, radius: 8pt)[#image("sym/bulb-svgrepo-com.svg", width: 110%)],
  circle(stroke: colour, radius: 8pt)[#image("sym/console-svgrepo-com.svg", width: 110%)],
  circle(stroke: colour, radius: 8pt)[#image("sym/alarm-clock-svgrepo-com.svg", width: 110%)],
  
  
  
  )
]
#let pnum = counter("pnum")
#let main_page(num) = {
 context block(width: 100%, height: 100%)[#place(rect(fill:white, width: 100%, height: 100%)[
  #if(num == 0){
    place(rect(fill:dotting, width: 100%, height: 100%)[])
    place(bottom + center,rect(width:100%, height: 3em, fill:white))
    place(bottom + center,dx:2pt,rect(width:100%-9.5em, height: 3em, fill:white)[#align(center+horizon)[#bottom_line]#place(center+horizon,dx:14.4em,text(luma(80%), size:13pt)[#num])])
    place(bottom,qr-code("P01 V0I S0000000", width: 3.5em))
  } else {
    place(rect(fill:dotting, width: 100%, height: 100%)[])
    place(bottom + center,rect(width:100%, height: 3em, fill:white))
    place(bottom + center,dx:-2pt,rect(width:100%-9.5em, height: 3em, fill:white)[#align(center+horizon)[#bottom_line]#place(center+horizon,dx:-14.4em,text(luma(80%), size:13pt)[#num])])
    place(right+bottom,qr-code("P01 V0I S0000000", width: 3.5em))
  }
  ])
 ]
}
#bookletic.sig(
  page-margin-binding: 2em,
  draft: false,
  p-num-layout: (
    bookletic.num-layout(
      p-num-start: 1,
      p-num-alt-start: none,
      p-num-align-horizontal: right,
      p-num-align-vertical: horizon,
      p-num-halign-alternate: false,
    ),
  ),
  contents: (
    for i in range(1,17){
    ([#main_page(i)],)
    }
  ),
)
// #place(top+left,image("Image (3).png"))
// #(4*main_page())
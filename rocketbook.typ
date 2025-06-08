
#set page(margin: 1em, fill: black, paper: "a4")
#let num_dots = 30
#let page_width = layout(size => {
  let width = size.width
  [#(width)]
})
#let page_width = 573.2755905511811pt

#let dotting = tiling(
  size: ((page_width/num_dots),(page_width/num_dots)),
  spacing: (0pt, 0pt),
  relative: "parent",
  place(circle(radius: 1pt, fill: luma(100))),
)
#let main_page() = {
 place(rect(fill:white, width: 100%, height: 100%)[ ])
 place(rect(fill:dotting, width: 100%, height: 100%)[ ])
}

#main_page()
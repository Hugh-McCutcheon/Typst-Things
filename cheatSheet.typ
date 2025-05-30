// #let headingArray = ()
#let cheatSheet(
  title: "",
  blackNWhite: false,
  doc,
) = {
  set document(title: title)
  set page(
    paper: "a4",
    margin:(
      6.34mm
    )
  )
  set heading(
    numbering: "1.a.I"
  )

  let hues = (
    0deg, // red
    40deg, // orng
    90deg, // grn
    180deg, // purp
    240deg,
    270deg,
    300deg,
  )
  let saturation = 60%
  let lightness = 90%

  let heading_summary_data = state("heading_summary_data", ())
  let cur_h1 = state("cur_h1", (
    hue: hues.first(),
  ))
  // let h1_cycle = state("h1_cycle", 0)

  show heading.where(level: 1): it => {
    heading_summary_data.update(arr => arr + (0,)) // count up the header 1s

    let header_num = counter(heading).get().at(0)
    let hue = hues.at(calc.rem(header_num, hues.len())-1)
    [#hue]
    let colour = color.hsv(hue, saturation, lightness)


    rect(text(fill:white)[#it.body], width:100%,fill: colour, radius: .5em)
  }

  show heading.where(level: 2): it => {
    heading_summary_data.update(arr => {
      if arr.len() > 0 {
        let last_h1_entry = arr.pop() 
        let updated_h1_entry = (
          last_h1_entry + 1
        )
        arr.push(updated_h1_entry)
      }
      return arr
    })
    // colour management
    let h_sum = heading_summary_data.final()
    let parent_num = (counter(heading).get().at(0))
    let parent_hue = hues.at(calc.rem(parent_num, hues.len())-1)
    let next_parent_hue = hues.at(calc.rem(parent_num+1, hues.len())-1)
    let cur_colour_band = next_parent_hue - parent_hue
    
    let header_num = counter(heading).get().at(1)
    // let hue = parent_hue
    if h_sum.at(parent_num -1) != 0 {
      let hue = parent_hue+((cur_colour_band/h_sum.at(parent_num -1)*header_num))
      let colour = color.hsv(hue, saturation, lightness)
      // [hue #hue parent hue#parent_hue next parent hue#next_parent_hue cur colour band #cur_colour_band, header_num #header_num parent num #parent_num #h_sum.at(parent_num -1)]
      rect(text(fill:white)[#it.body], width:100% -2em,fill: colour, radius: .5em)
    } 
    // [#h_sum.at(parent_num -1)]
    //Heading 2 Body
  }
  doc
  context[
    \ #let counts_array = heading_summary_data.final()
    #counts_array
  ]

  let i = 0
  for value in hues {
    place(left,dy: 2.7em*i,square(fill:color.hsv(value, saturation, lightness, 100%)))
    i+=1
  }
}

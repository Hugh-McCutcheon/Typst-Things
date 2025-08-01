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
      // 6.34mm // this is average printer margins
      0.5em // for feeling sexy
    ),
  // columns: 3,
  flipped: false
  )

  set terms(separator:[:#h(0.6em, weak:true)])
  set heading(
    numbering: "1.a.I",
  )
  // show heading: it => {

  // }

show table.cell.where(y:0): set text(style: "normal", weight: "bold")
  set table(inset:3pt)
  set columns(gutter:0.1em)
  set text(
    // size: 7.5pt
    // size: 11pt
    size: 10pt
  )
  set image(
    width: 80%,
  )

  set rect(inset: 0.3em)
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
  let blockSett = (inset:0.5em, below:0.01em, above:0.01em)
  show heading.where(level: 1): it => {
    heading_summary_data.update(arr => arr + (0,)) // count up the header 1s

    let header_num = counter(heading).get().at(0)
    let hue = hues.at(calc.rem(header_num, hues.len())-1)
    let colour = color.hsv(hue, saturation, lightness)

    show math.equation: set text(fill: white, stroke: 0.2pt + black)
    align(left, block(inset:blockSett.inset, below:blockSett.below, above: blockSett.above)[#rect(text(fill:white, stroke: 0.5pt + black)[#it.body], width:100%,fill: colour, radius: .5em)])
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
    show math.equation: set text(fill: white, stroke: 0.2pt + black)
    let bod = align(left,text(fill: white, stroke: 0.5pt + black)[#it.body])
    // colour management
    let h_sum = heading_summary_data.final()
    let parent_num = (counter(heading).get().at(0))
    let parent_hue = hues.at(calc.rem(parent_num, hues.len())-1)
    let next_parent_hue = hues.at(calc.rem(parent_num+1, hues.len())-1)
    let cur_colour_band = next_parent_hue - parent_hue
    if cur_colour_band == -300deg {cur_colour_band = 60deg}

    let header_num = counter(heading).get().at(1)
    // let hue = parent_hue
    if h_sum.at(parent_num -1) > 1 {
      let hue = parent_hue+((cur_colour_band/h_sum.at(parent_num -1)*header_num))
      let colour = color.hsv(hue, saturation, lightness)
      // [hue #hue parent hue#parent_hue next parent hue#next_parent_hue cur colour band #cur_colour_band, header_num #header_num parent num #parent_num #h_sum.at(parent_num -1)]
      align(left, block(inset:blockSett.inset, below:blockSett.below, above: blockSett.above)[#rect(bod, width:100% -4em,fill: colour, radius: .5em)])
    } else  if h_sum.at(parent_num -1) != 0 {
      let hue = parent_hue+((cur_colour_band/1.5))
      let colour = color.hsv(hue, saturation, lightness)
      align(left, block(inset:blockSett.inset, below:blockSett.below, above: blockSett.above)[#rect(bod, width:100% -4em,fill: colour, radius: .5em)])

    }
  }

  doc
}

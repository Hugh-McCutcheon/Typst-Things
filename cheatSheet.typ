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
    60deg, // orng
    120deg, // yeller
    180deg, // grn
    240deg, // bloo
    300deg, // purp
  )
  let saturation = 60%
  let lightness = 90%

  let heading_summary_data = state("heading_summary_data", ())
  let cur_h1 = state("cur_h1", (
    hue: hues.first(),
  ))
  let h1_cycle = state("h1_cycle", 0)

  show heading.where(level: 1): it => {
    heading_summary_data.update(arr => arr + (0,))
    let h1_cur_cycle = h1_cycle.get() // convergence here
    h1_cycle.update(v => rm((v + 1), hues.len())) // convergence problem here




    rect(text(fill:white)[#it.body], width:100%,fill: red, radius: .5em)
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
    context[
      #let counts_array = heading_summary_data.final()
      #rect(text(fill:white)[#it.body], width:100% -2em,fill: red, radius: .5em)
    ]
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

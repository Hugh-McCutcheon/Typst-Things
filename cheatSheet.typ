// #let headingArray = ()
#let s = state("x", (1,))
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


  let heading_summary_data = state("heading_summary_data", ())

  show heading.where(level: 1): it => {
    heading_summary_data.update(arr => arr + (0,))
    it
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
    it
  }
  doc
  context[
    #let counts_array = heading_summary_data.final()
    #counts_array
  ]
}
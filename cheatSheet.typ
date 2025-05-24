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


  let mine = counter("my counter")
  let s = state("head", [])
  let countUp(part) = {
    // let array = (0,0,0)
    mine.update(part)
  }
  let increaseCount(headerNum) = {
    mine.at
  }
  let findColour(test) = {
    mine.final()
  }
  show heading.where(level: 1): it => [
    #mine.update(1)
    #rect([#it.body ], width:100%,fill: red, radius: .5em)
  ]
  show heading.where(level: 2): it => [
    #rect(it.body, width:100% -2em,fill: red, radius: .5em)
    // #mine.update(n => n+1)
    // #mine.final()
    // #mine.get()
    // #mine.get()
    // #s.update()
    #counter(heading.where(level: 2)).final()
    this is s: #s.get()\
    #counter(heading).get()
    #countUp(counter(heading).get())\
    this is mine: #mine.get()
    // #findColour("test")
  ]
  doc
}
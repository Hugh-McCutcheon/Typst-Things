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


  let mine = counter("my counter")
  mine.update(())

  let countArray = (0,)

  let countUp(part) = {
    // let array = (0,0,0)
    let parent = part.at(0)
    // mine.at(0)
    [#parent]
    [#mine.get()]
    if mine.get() == none{
      [nononene]
    } else {
      [something]
    }
    [\ test: #part : #mine.get()]
    mine.update(part)
  }
  let increaseCount(headerNum, array) = {
    let parent = headerNum.at(0) -1
    let child = headerNum.at(1)
    // [#parent #child]
    let newCount = array
    if(newCount.at(parent, default: -1) == 0) { // change the value at a position
      newCount.pop()
      newCount.push(child)
      // count.at(headerNum.at(0), default: 0)
    } else { // add a new value to the thingy

      // newCount.push(12)  
      newCount.push(child)  
    }
    return (newCount)
    // return(parent, child)
    // return(newCount.at(parent, default: -1))
  }
  let findColour(test) = {
    mine.final()
  }
let heading_summary_data = state("heading_summary_data", ())
  // Show rule for Level 1 headings
show heading.where(level: 1): it => {
  // Append a new entry for this H1 heading.
  // 'it.body' captures the content of the heading.
  heading_summary_data.update(arr => arr + ((title: it.body, h2_count: 0),))
  
  // Display the heading as usual
  it
}

// Show rule for Level 2 headings
show heading.where(level: 2): it => {
  heading_summary_data.update(arr => {
    // Check if there's at least one H1 heading processed.
    // This ensures we only count H2s that are under an H1.
    if arr.len() > 0 {
      // Get the last H1 entry (the one we are currently under).
      // .pop() removes and returns the last element.
      let last_h1_entry = arr.pop() 
      
      // Increment its H2 count.
      let updated_h1_entry = (
        title: last_h1_entry.title, 
        h2_count: last_h1_entry.h2_count + 1
      )
      
      // Add the updated entry back to the array.
      // .push() appends an element to the end.
      arr.push(updated_h1_entry)
    }
    // If no H1 has been encountered yet, this H2 is not counted
    // under any specific H1 by this logic.
    return arr
  })
  
  // Display the heading as usual
  it
}

// Function to display the summary of H2 counts per H1 heading
let display_heading_summary() = {
  // Retrieve the final state value after the document has been processed.
  context[#let summary = heading_summary_data.final()

  #if summary.len() == 0 {
    [No level 1 headings found in the document.]
  } else {
    // You can style this summary section as needed.
    block(stroke: 1pt + blue, inset: 8pt, radius: 4pt)[
      #set text(blue.darken(30%))
      #strong[Summary of Level 2 Headings per Level 1 Heading]
      #v(1em) // Vertical spacing

      #for item in summary {
        // Display the title of the H1 heading.
        // Using 'block' ensures the heading content is displayed correctly.
        block[#strong[#item.title]]
        // Display the count of H2 headings.
        pad(left: 1em)[Number of level 2 headings: #item.h2_count]
        v(0.5em) // Vertical spacing between entries
      }
    ]
  }
]}
  doc
  context[
    #heading_summary_data.get()
    // #heading_summary_data.at()
    ]
  display_heading_summary()
}
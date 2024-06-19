#let section_title = state("section_title", [#h(1em)])

#let project(title: "", authors: "Andoiii", header_after: 0, body) = {

  set heading(numbering: "1.")
  
  
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(
    paper: "us-letter",
    margin: (top: 15%),
    header: context {
      if counter(page).get().at(0) > header_after [
        #show par: set block(spacing: 0.65em)
        #grid(
          columns: (1fr, 1fr),
          row-gutter: 0%,
          inset: 0pt,
          [*BU 231 Course Notes*], align(right)[#authors],
        )
        #v(-8pt)
        *#section_title.get()*
        #v(-4pt)
        #line(length: 100%, stroke: 3pt + black)
        #v(-1em)
      ]
    },
  footer: context {
    if counter(page).get().at(0) > header_after [
      #h(1fr)
  #counter(page).display(
    "1",
    both: false,
  )
  ]
  }
  
  )
  // section_title.update(x => [])
  body
}

// Patrik's Fold Selector. May be useful.
#let foldSelector(..entries) = {
  let entries = entries.pos()
  if entries.len() == 0 {
    heading.where(outlined: true)
  } else {
    let value = selector(entries.at(0))
    let _ = entries.remove(0)
    value.or(..entries) 
  }
}


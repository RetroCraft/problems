#import "../template.typ": *
#import "../preface.typ": *

#import "./agency.typ": *
#import "./franchise.typ": *
#import "./employment.typ": *
#import "./transactions.typ": * 
#import "./bonus.typ": *

#show: project.with(
  title: "Various Relationships"
)

#let Relationships_Chapter(pre: [#pagebreak()]) = [
  // Update Heading
  #section_title.update(x => [*The Law of Relationships*])
  #pre
  = The Law of Relationships

  #Relationships_Agency1
  #pagebreak()
  
  #Relationships_Franchise
  #pagebreak()
  
  #Relationships_Employment
  #pagebreak()

  #Relationships_Transactions
  #pagebreak()
  
  #Relationships_Bonus
]

#Relationships_Chapter(pre: [
  #align(center)[
    #v(3em)
    #text(size: 60pt)[*BU 231*] 
    #v(-3em)
    #text(size: 40pt)[*Business Law Notes*] 
    #v(-3em)
    #text(size: 20pt)[*Section 4: The Law of Relationships*]
    #v(-1em)
    #text(size: 12pt)[by Andy Chang]

    #update
  ]
  #outline(depth: 2)

  #preface
  #pagebreak()
])
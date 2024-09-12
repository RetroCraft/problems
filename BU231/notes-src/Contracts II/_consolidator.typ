#import "../template.typ": *
#import "../preface.typ": *

#import "./interp-assign.typ": *
#import "./discharge.typ": *
#import "./tidbits2.typ": *
#import "./damages.typ": *

#show: project.with(
  title: "Contract Law II"
)

#let Contracts_II_Chapter(pre: [#pagebreak()]) = [
  // Update Heading
  #section_title.update(x => [*The Law of Contracts II*])
  #pre
  = The Law of Contracts II
  #Contracts_Interpret_Privy
  
  #pagebreak()

  #Contracts_Assignment
  #pagebreak()

  #Contracts_Discharge
  #pagebreak()

  #Contracts_Breach
  #pagebreak()

  #Contracts_Damages
  #pagebreak()
  
  #Contract2_Tidbits
    
 
  
]

#Contracts_II_Chapter(pre: [
  #align(center)[
    #v(3em)
    #text(size: 60pt)[*BU 231*] 
    #v(-3em)
    #text(size: 40pt)[*Business Law Notes*] 
    #v(-3em)
    #text(size: 20pt)[*Section 3: The Law of Contracts II*]
    #v(-1em)
    #text(size: 12pt)[by Andy Chang]

    #update
  ]
  #outline(depth: 2)

  #preface
  #pagebreak()
])
#import "../template.typ": *
#import "../preface.typ": *

#import "./intro.typ": *
#import "./elements.typ": *
#import "./exit.typ": *
#import "./tidbits.typ": *

#show: project.with(
  title: "Contract Law"
)

#let Contracts_Chapter(pre: [#pagebreak()]) = [
  // Update Heading
  #section_title.update(x => [*The Law of Contracts*])
  #pre
  = The Law of Contracts
  #Contracts_Intro
  #pagebreak()
  
  #Contracts_Elements_Offer_Acceptance 
  #pagebreak()
  #Contracts_Elements_Consideration_Others
  #pagebreak()
  
  #Contracts_ExitWriting
  #pagebreak()
  #Contracts_ExitWriting2
  #pagebreak()
  #Contracts_ExitWriting3
  #pagebreak()
  
  #Contract_Tidbits
    
 
  
]

#Contracts_Chapter(pre: [
  #align(center)[
    #v(3em)
    #text(size: 60pt)[*BU 231*] 
    #v(-3em)
    #text(size: 40pt)[*Business Law Notes*] 
    #v(-3em)
    #text(size: 20pt)[*Section 2: The Law of Contracts*]
    #v(-1em)
    #text(size: 12pt)[by Andy Chang]

    #update
  ]
  #outline(depth: 2)

  #preface
  #pagebreak()
])
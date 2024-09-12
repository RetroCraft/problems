#import "../template.typ": *
#import "../preface.typ": *

#import "./organization.typ": *
#import "./other.typ": *
#import "./governance.typ": *
#import "./last.typ": *

#show: project.with(
  title: "Business and IP and Others"
)

#let BIP_Chapter(pre: [#pagebreak()]) = [
  // Update Heading
  #section_title.update(x => [*The Law of Business and IP and Others*])
  #pre
  = The Law of Business and IP and Others

  #BIP_Organization
  #pagebreak()
  
  #BIP_Governance
  #pagebreak()
  
  #BIP_IP
  #pagebreak()

  #BIP_Privacy
  #pagebreak()

  #BIP_Intl
  #pagebreak()
  
  #BIP_Other
]

#BIP_Chapter(pre: [
  #align(center)[
    #v(3em)
    #text(size: 60pt)[*BU 231*] 
    #v(-3em)
    #text(size: 40pt)[*Business Law Notes*] 
    #v(-3em)
    #text(size: 20pt)[*Section 5: The Law of Business and IP and Others*]
    #v(-1em)
    #text(size: 12pt)[by Andy Chang]

    #update
  ]
  #outline(depth: 2)

  #preface
  #pagebreak()
])
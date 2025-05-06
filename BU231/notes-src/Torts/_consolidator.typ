#import "../template.typ": *
#import "../preface.typ": *

#import "./intro.typ": *
#import "./intentional-torts.typ": *
#import "./negligence.typ": *
#import "./tidbits.typ": *
#import "./business-torts.typ": *

#show: project.with(
  title: "Tort Law"
)

#let Torts_Chapter(pre: [#pagebreak()]) = [
  // Update Heading
  #section_title.update(x => [*The Law of Torts*])
  #pre
  
  = The Law of Torts
  
  #Torts_Intro
  #pagebreak(weak: true)
  #Torts_Intentional
  #pagebreak(weak: true)
  #Torts_Negligence
  #pagebreak(weak: true)
  #Torts_Negligence2
  #pagebreak(weak: true)
  #Torts_Business
  #pagebreak(weak: true)
  #Torts_Appendix
]

#Torts_Chapter(pre: [
  #align(center)[
    #v(3em)
    #text(size: 60pt)[*BU 231*] 
    #v(-3em)
    #text(size: 40pt)[*Business Law Notes*] 
    #v(-3em)
    #text(size: 20pt)[*Section 1: The Law of Torts*]
    #v(-1em)
    #text(size: 12pt)[by Andy Chang]

    #update
  ]
  #outline(depth: 2)

  #preface
  #pagebreak()
])

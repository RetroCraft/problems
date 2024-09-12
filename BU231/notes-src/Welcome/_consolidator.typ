#import "../template.typ": *
#import "../preface.typ": *

#import "./intro.typ": *
#import "./ethics.typ": *

#show: project.with(
  title: "Intro to BU 231"
)

#let Intro_Chapter(pre: [#pagebreak()]) = [
  // Update Heading
  #section_title.update(x => [*Intro to BU 231*])
  #pre
  
  = Intro to BU 231
  #Intro_Legal
  #pagebreak()

  #Intro_Ethics
  
]

#Intro_Chapter(pre: [
  #align(center)[
    #v(3em)
    #text(size: 60pt)[*BU 231*] 
    #v(-3em)
    #text(size: 40pt)[*Business Law Notes*] 
    #v(-3em)
    #text(size: 20pt)[*Section 1: Intro to BU 231*]
    #v(-1em)
    #text(size: 12pt)[by Andy Chang]

    #update
  ]
  #outline(depth: 2)

  #preface
  #pagebreak()
])

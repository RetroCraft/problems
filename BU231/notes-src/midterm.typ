#import "./template.typ": *

#show: project.with(title: "", header_after: 1)


#import "./Welcome/_consolidator.typ": *
#import "./Torts/_consolidator.typ": *
#import "./Contracts/_consolidator.typ": *
#import "./Contracts II/_consolidator.typ": *
#import "./Relationships/_consolidator.typ": *
#import "./CGIP/_consolidator.typ": *



#align(horizon + center)[
    #v(3em)
    #text(size: 60pt)[*BU 231*] 
    #v(-3em)
    #text(size: 40pt)[*Business Law Notes*] 
    #v(-3em)
    #text(size: 20pt)[*Midterm Content Only*]
    #v(-1em)
    #text(size: 12pt)[by Andy Chang]

    #update
]

#v(10em)
#preface
#pagebreak()
#outline(
  title: "Table of Contents",
  depth: 2,
  indent: 2em,
)

#Torts_Chapter()

#Contracts_Chapter()

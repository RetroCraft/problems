#import "./template.typ": *

#show: project.with(title: "", header_after: 1)

#import "./title.typ": *
#import "./Torts/_consolidator.typ": *
#import "./Contracts/_consolidator.typ": *


#titlePage
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
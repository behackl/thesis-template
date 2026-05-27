#import("bhthesis.typ"): *

#set text(lang: "de", hyphenate: true)
#set par(justify: true, linebreaks: "optimized", leading: 0.95em)

#show: doc => thesistemplate(
  title: [Ein schönes Seminarthema],
  running_title: "Ein schönes Seminarthema",
  author: "Max Mustermann",
  thesis_type: "Seminararbeit",
  course: "Seminar (Diskrete Mathematik und Algorithmentheorie), S26",
  instructor: "Dipl.-Ing. Dr. Benjamin Hackl",
  university: [
    Universität Graz / Naturwissenschaftliche Fakultät \
    Kooperationsverband NAWI Graz
  ],
  doc,
)

#outline(indent: auto)
#pagebreak()

= Einleitung

Dies ist eine kurze Seminararbeit.

== Motivation

Hier steht die Motivation des Seminarthemas.

= Hauptteil

Hier beginnt der Hauptteil.

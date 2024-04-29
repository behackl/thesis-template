#import("bhthesis.typ"): *

#set text(lang: "en", hyphenate: true)
#set par(justify: true, linebreaks: "optimized", leading: 0.95em)

#show: doc => thesistemplate(
  title: [A tremendous thesis with a long\ title over multiple lines],
  running_title: "A tremendous thesis",
  author: "Martina Musterfrau",
  thesis_type: "Master's Thesis",
  study_program: "Mathematics",
  academic_degree: "Diplom-Ingenieurin (Dipl.-Ing.)",
  university: [
    Universität Graz / Naturwissenschaftliche Fakultät \
    Kooperationsverband NAWI Graz
  ],
  people: (
    thesisperson(
      role: "Advisor and Examiner",
      name: "Dipl.-Ing. Dr. Benjamin Hackl",
      affiliation: [Department of Mathematics and Scientific Computing \ University of Graz]
    ),
  ),
  
  /* In case advisor / examiner role is split, or multiple people
  are involved in general, just add more entries to the array:
  (
    thesisperson(
      role: "Advisor",
      name: "Dipl.-Ing. Dr. Benjamin Hackl",
      affiliation: [Department of Mathematics and Scientific Computing \ University of Graz]
    ),
    thesisperson(
      role: "Examiner",
      name: "Univ.-Prof. Dr. Alexandra Musterfrau",
      affiliation: [Department of Discrete Mathematics \ Technical University of Graz]
    ),
  ), */
  doc
)

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}

#heading(numbering: none, "Abstract")

This is a short summary of the contents of the thesis.

#lorem(100)
#pagebreak()

#outline(indent: auto)
#pagebreak()

= Introduction

== A few demo environments

#definition("Open set")[
  A set $Omega subset.eq CC$ is said to be _open_, if for every $z_0$ in
  $Omega$ there is a positive number $epsilon > 0$ such that for all $z in CC$
  that satisfy $abs(z - z_0) < epsilon$ we find $z in Omega$.
]

#theorem("Cauchy's Integral Theorem")[
  Let $Omega subset.eq CC$ be an open and simply connected set.
  Let $gamma: [0, 1] -> Omega$ be a closed path in $Omega$, and let $f: gamma^* -> CC$ be a holomorphic function. Then the relation
  $ integral.cont_gamma f(z) "d"z = 0 $
  holds.
] <thm:cauchy-integral-theorem>

The following example verifies @thm:cauchy-integral-theorem for a given
function.

#example[
  Consider $f: CC -> CC$ with $z |-> z^2$. Then, by @thm:cauchy-integral-theorem
  we have
  $ integral.cont_(abs(z) = 42) f(z) "d"z = 0. $
  In this case, we can also compute the integral directly by straightforward
  computation of the line integral; we use the curve $gamma: [0, 1] -> CC$
  with $gamma(t) = 42 dot exp(2 pi i t)$. Then we have
  $ 
  integral.cont_(abs(z) = 42) f(z) "d"z & = 
  integral_0^1 f(gamma(t)) dot gamma'(t) "d"t \
  &= 42^3 dot 2 pi i dot [ exp(6 pi i t) / (6 pi i) ]_0^1
  = 42^3 dot 2 pi i dot (1 - 1) / (6 pi i) = 0, 
  $
  which verifies the theorem.
]

#lorem(100)

== Improvements?

Feel free to adapt / polish the styling suggested by this template
in any way you like. This template is hosted at
https://github.com/behackl/thesis-template -- I am happy to
discuss ideas and suggestions for general improvement of this template.

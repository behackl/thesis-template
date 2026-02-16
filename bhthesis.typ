#import "@preview/ctheorems:1.1.3": thmrules, thmplain, thmbox, thmproof
#import "@preview/hydra:0.6.2": hydra

#let kfuyellow = rgb("#ffcc00")
#let kfuyellowlight = rgb("#fff9e0")

#let theorem = thmbox("theorem", "Theorem", breakable: true, fill: kfuyellowlight, radius: 2pt, base_level: 1)
#let proposition = thmbox("theorem", "Proposition", breakable: true, fill: kfuyellowlight, radius: 2pt, base_level: 1)
#let corollary = thmbox(
  "theorem",
  "Corollary",
  breakable: true,
  fill: kfuyellowlight,
  base: "theorem",
  base_level: 1,
)
#let lemma = thmplain(
  "theorem",
  "Lemma",
  base: "theorem",
  base_level: 1,
)
#let proof = thmproof("theorem", "Proof")

#let definition = thmbox(
  "theorem",
  "Definition",
  inset: (x: 0.5em, top: 0.5em, bottom: 0.5em),
  radius: 0pt,
  stroke: (
    left: (thickness: 0.25em, paint: kfuyellow),
  ),
  base_level: 1,
)

#let remark = thmplain(
  "theorem",
  "Remark",
  inset: (x: 0pt),
  base_level: 1,
)
#let notation = thmplain(
  "theorem",
  "Notation",
  inset: (x: 0pt),
  base_level: 1,
)
#let example = thmplain(
  "theorem",
  "Example",
  inset: (x: 0pt),
  bodyfmt: body => [
    #body #h(1fr) $penta.stroked$
  ],
  base_level: 1,
)

#let todo(arg) = box(stroke: red, fill: rgb("#ffeded"), inset: 5pt, width: 100%)[
  *TODO:* #arg
]

#let kfuemph = (it) => {
  underline(emph(it), stroke: kfuyellow + 1.5pt)
}
#let mathcol(expr, fill: rgb("#006FD6")) = text(fill: fill, $#expr$)

#let thesisperson = (role: str, name: str, affiliation: content) => {
  smallcaps(text(size: 14pt, role))
  linebreak()
  text(size: 12pt, name)
  linebreak()
  text(size: 9pt, affiliation)
}

#let thesistitlepage = (
  title: str,
  thesis_type: str,
  author: str,
  academic_degree: str,
  study_program: str,
  university: str,
  people: array,
  ) => {
  grid(
    columns: 3,
    column-gutter: 1fr,
    align: (left + horizon, center + horizon, right + horizon),
    image("assets/logo_tugraz.svg", height: 1.55cm),
    image("assets/logo_nawigraz.png", height: 1cm),
    image("assets/logo_kfumath.png", height: 1.45cm)
  )
  v(1cm)

  align(center, text(size: 18pt, author))
  line(length: 100%, stroke: 2pt)
  v(-0.5cm)
  align(center)[
    #underline(stroke: 8pt + kfuyellow, offset: 0pt, background: true, evade: false)[
      #text(size: 32pt, title)
    ]
  ]
  v(-0.5cm)
  line(length: 100%, stroke: 2pt)
  v(1cm)
  align(center, smallcaps(text(22pt, thesis_type)))
  context {
    if text.lang == "de" {
      align(center, text("zur Erlangung des akademischen Grades"))
    } else {
      align(center, text("in fulfillment of the requirements for the academic degree"))
    }
  }
  align(center, text(size: 16pt, academic_degree))
  context {
    if text.lang == "de" {
      align(center, text("im Rahmen des Studienprogramms"))
    } else {
      align(center, text("within the study degree program"))
    }
  }
  align(center, text(size: 16pt, study_program))
  v(1.5cm)
  align(center, text(size: 14pt, university))
  v(1.5cm)
  grid(columns: 2, column-gutter: 1fr, align: (left, right), ..people)
  v(1fr)
  align(right, 
    text(12pt, [Graz, #datetime.today().display("[day].[month].[year]")])
  )
  pagebreak()
  pagebreak()
} 

#let thesistemplate = (
  title: content,
  running_title: str,
  thesis_type: str,
  author: str,
  study_program: str,
  academic_degree: str,
  university: str,
  people: array,
  doc
) => {
  set document(
    title: title,
    author: author,
  )
  set page(
    paper: "a4",
    header: context {
      if counter(page).at(here()).first() > 2 {
        emph(running_title)
        h(1fr)
        emph(hydra())
        v(-0.5em)
        line(length: 100%)
      }
    },
  )
  
  set heading(numbering: "1.1")
  show heading.where(level: 1, numbering: none): it => {
    underline(
      stroke: 4pt + kfuyellow,
      offset: 0pt,
      background: true,
      evade: false,
      text(size: 24pt, it.body)
    )
    v(1em)
  }
  show heading.where(level: 1, numbering: "1.1"): it => {
    let heading_content = [ #counter(heading).display("§1") – #it.body ]
    underline(
      stroke: 4pt + kfuyellow,
      offset: 0pt,
      background: true,
      evade: false,
      text(size: 24pt, heading_content)
    )
    v(1em)
  }
  show heading.where(level: 2): it => {
   it
   v(0.6em)
  }
  show: thmrules.with(qed-symbol: $square$)
  show figure.caption: it => {
    box(
      width: 85%,
      align(center, box(align(left, [#emph([#it.supplement #context it.counter.display(it.numbering):]) #it.body])))
    )
  }
  show link: it => { text(fill: color.olive, it) }
  show ref: it => {
    let eq = math.equation
    let el = it.element
    if el != none and el.func() == eq {
      // Override equation references.
      text(fill: color.olive, 
        numbering(
          el.numbering,
          ..counter(eq).at(el.location())
        )
      )
    } else {
      // Other references as usual.
      text(fill: color.olive, it)
    }
  }
  
  thesistitlepage(title: title, thesis_type: thesis_type, author: author, study_program: study_program, academic_degree: academic_degree, university: university, people: people)
  set page(numbering: "1")

  doc
}

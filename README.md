# Templates für Abschlussarbeiten

Hier werden LaTeX- und Typst-Vorlagen für akademische
Abschlussarbeiten (und dabei insbesondere im 
Rahmen vom [NAWI-Verband](https://www.nawigraz.at)
in Graz) bereitgestellt.

## Typst: `bhthesis.typ`

In `bhthesis.typ` werden diverse styling und content functions (`kfuyellow`, `kfuemph`,
`mathcol`, `todo`; Satz- und Definitions-Umgebungen `theorem`, `proposition`,
`corollary`,  `lemma`, `proof`, `definition`, `remark`, `notation`, `example`),
sowie die zentrale Funktion `thesistemplate` bereitgestellt.

Ein Beispieldokument ist in `thesis_template_typst.typ` zu finden.

### Optionen

- Wird `text.lang` auf `"de"` gesetzt, werden die Titel der Satz- und
  Definitionsumgebungen (z.B. "Satz", "Beispiel") sowie die
  Titelseiten-Textbausteine auf Deutsch umgestellt.


## LaTeX: `bhthesis.cls`

Stellt die LaTeX-Klasse `bhthesis` zur Verfügung (Styling in
`bhthesis-style.sty`). Siehe `thesis_template_latex.tex` für ein
Beispieldokument.


### Unterstützte Flags

- `withdegree`: Kontrolliert, ob "zur Erlangung des akademischen Grades\\ \degree"
  eingeblendet wird. (Wird für Bachelorarbeiten nicht benötigt.)

- `english`: Kontrolliert, ob die eingebauten Textbausteine auf Englisch
  eingebunden werden (alternativ, wenn nicht gesetzt: auf Deutsch). Zusätzlich
  werden die Namen von Satz- und Definitionsumgebungen lokalisiert, sofern
  `babel` nicht bereits eine Sprache vorgibt.

### Styling-Anpassungen

- Die Innenabstände der schattierten Satzumgebungen lassen sich über
  `\setlength{\bhtheorempadding}{<Länge>}` steuern.

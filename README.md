# Templates für Abschlussarbeiten

LaTeX- und Typst-Vorlagen für akademische Abschlussarbeiten, insbesondere im
Rahmen vom [NAWI-Verband](https://www.nawigraz.at) in Graz.

Die beiden Vorlagen sind getrennt organisiert:

- `latex/` enthält die LaTeX-Klasse und ein Beispieldokument.
- `typst/` enthält das Typst-Package und ein Beispieldokument.
- `assets/` enthält gemeinsame Logos. In `latex/assets` und `typst/assets`
  zeigen Symlinks auf diesen Ordner, damit die Beispiele direkt aus dem
  jeweiligen Unterordner kompiliert werden können.

## Quick start: LaTeX

```bash
cd latex
latexmk -pdf thesis_template_latex.tex
```

Für eine eigene Arbeit kopiere den Ordner `latex/` inklusive `assets/` in dein
Projekt und passe die Metadaten am Anfang von `thesis_template_latex.tex` an.

Das Beispieldokument zeigt außerdem, wie Satzumgebungen, Quellcode-Listings und
Literaturverweise mit BibTeX verwendet werden. Die Datei `references.bib` enthält
einen Beispiel-Eintrag.

Die Klasse `bhthesis.cls` stellt u.a. folgende Befehle bereit:

- `\reporttype{...}`
- `\studname{...}`
- `\degree{...}`
- `\involvedpeople{...}`
- `\university{...}`
- `\universityname{...}`
- `\fakultaetname{...}`
- `\city{...}`

### Unterstützte Klassenoptionen

- `withdegree`: blendet den Block „zur Erlangung des akademischen Grades …“
  ein. Für Bachelorarbeiten wird dieser Block oft nicht benötigt.
- `english`: verwendet englische eingebaute Textbausteine. Theoremnamen werden
  außerdem lokalisiert, sofern `babel` nicht bereits eine Sprache vorgibt.

### Quellcode und Literatur

Für Quellcode lädt die Klasse das Paket `listings` und definiert einen passenden
Standardstil. Inline-Code kann mit `\code{...}` gesetzt werden, längere
Codeblöcke mit der Umgebung `lstlisting`.

Literatur wird im Beispiel klassisch mit BibTeX eingebunden:

```tex
\bibliographystyle{alpha}
\bibliography{references}
```

`latexmk -pdf thesis_template_latex.tex` führt die nötigen BibTeX-Läufe
automatisch aus.

### Styling-Anpassungen

Die Innenabstände der schattierten Satzumgebungen lassen sich über

```tex
\setlength{\bhtheorempadding}{<Länge>}
```

steuern.

## Quick start: Typst

```bash
cd typst
typst compile thesis_template_typst.typ
```

Für eine eigene Arbeit kopiere den Ordner `typst/` inklusive `assets/` in dein
Projekt und passe die Metadaten im `#show: doc => thesistemplate(...)`-Block von
`thesis_template_typst.typ` an.

`bhthesis.typ` stellt Styling- und Content-Funktionen bereit:

- Farben und Helfer: `kfuyellow`, `kfuemph`, `mathcol`, `todo`
- Umgebungen: `theorem`, `proposition`, `corollary`, `lemma`, `proof`,
  `definition`, `remark`, `notation`, `example`
- zentrale Funktion: `thesistemplate`

Wird `text.lang` auf `"de"` gesetzt, werden Satz- und Definitionsumgebungen
sowie Titelseiten-Textbausteine auf Deutsch umgestellt.

Das Beispieldokument zeigt außerdem Typst-Codeblöcke mit hellgrauem Hintergrund
sowie Literaturverweise über `#bibliography("references.bib")`. Die Datei
`references.bib` enthält einen Beispiel-Eintrag.

Wichtige optionale Argumente von `thesistemplate`:

- `running_title: none`
- `thesis_type: "Master's Thesis"`
- `study_program: none`
- `academic_degree: none`
- `university: none`
- `people: ()`
- `city: "Graz"`
- `date: datetime.today()`

## Release-Zips

Für Studierende sollen Releases zwei fertige ZIP-Dateien bereitstellen:

- `bhthesis-latex-template.zip`
- `bhthesis-typst-template.zip`

Diese ZIPs enthalten jeweils eine selbständige Vorlage mit kopiertem `assets/`-
Ordner statt Symlinks und der jeweiligen `references.bib`. Die Erstellung übernimmt die GitHub-Actions-Workflowdatei
`.github/workflows/release.yml` bei Tags/Releases oder manuell via
`workflow_dispatch`.

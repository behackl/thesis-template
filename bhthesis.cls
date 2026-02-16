\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bhthesis}[2026/02/16 Custom report class built on top of scrreprt.]

\newif\if@english\@englishfalse
\newif\if@withdegree\@withdegreefalse

\DeclareOption{english}{\@englishtrue}
\DeclareOption{withdegree}{\@withdegreetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax

\LoadClass{scrreprt}

\RequirePackage{bhthesis-style}

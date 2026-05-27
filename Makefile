.PHONY: all latex typst clean package

all: latex typst

latex:
	cd latex && latexmk -pdf thesis_template_latex.tex seminar_template_latex.tex

typst:
	cd typst && typst compile thesis_template_typst.typ
	cd typst && typst compile seminar_template_typst.typ

clean:
	cd latex && latexmk -C thesis_template_latex.tex seminar_template_latex.tex || true
	rm -f typst/thesis_template_typst.pdf typst/seminar_template_typst.pdf
	rm -rf dist

package:
	rm -rf dist
	mkdir -p dist/bhthesis-latex-template dist/bhthesis-typst-template
	cp latex/bhthesis.cls latex/thesis_template_latex.tex latex/seminar_template_latex.tex latex/references.bib dist/bhthesis-latex-template/
	cp -R assets dist/bhthesis-latex-template/assets
	cp typst/bhthesis.typ typst/thesis_template_typst.typ typst/seminar_template_typst.typ typst/references.bib dist/bhthesis-typst-template/
	cp -R assets dist/bhthesis-typst-template/assets
	cd dist && zip -r bhthesis-latex-template.zip bhthesis-latex-template
	cd dist && zip -r bhthesis-typst-template.zip bhthesis-typst-template

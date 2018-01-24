foa_id=2018-CFA
project_id=1234
submit_dir=submission

narrative=${submit_dir}/${foa_id}-Technical-Narrative-${project_id}.pdf
abstract=${submit_dir}/${foa_id}-Technical-Abstract-${project_id}.pdf
capabilities=${submit_dir}/${foa_id}-Capabilities-${project_id}.pdf
benefits_of_collaboration=${submit_dir}/${foa_id}-Benefits-of-Collaboration-${project_id}.pdf

all: ${submit_dir} ${narrative} ${abstract} ${benefits_of_collaboration} ${capabilities}

${submit_dir}:
	mkdir ${submit_dir}

${abstract}: project-data.tex abstract.tex acronyms.tex
	pdflatex abstract.tex
	pdflatex abstract.tex
	mv abstract.pdf $@

${capabilities}: project-data.tex capabilities.tex acronyms.tex
	pdflatex capabilities.tex
	pdflatex capabilities.tex
	mv capabilities.pdf $@

${narrative}: project-data.tex narrative.tex narrative.bib acronyms.tex
	pdflatex narrative.tex
	pdflatex narrative.tex
	pdflatex narrative.tex
	mv narrative.pdf $@

${benefits_of_collaboration}: project-data.tex benefits_of_collaboration.tex acronyms.tex
	pdflatex benefits_of_collaboration.tex
	pdflatex benefits_of_collaboration.tex
	mv benefits_of_collaboration.pdf $@

bib:
	pdflatex narrative.tex               
	bibtex narrative
	pdflatex narrative.tex
	pdflatex narrative.tex

tidy:
	rm -vf *.aux *.log *.blg *.bbl

clean: tidy
	rm -vf ${narrative} ${abstract} ${capabilities} ${benefits_of_collaboration}

foa_id=2018-CFA
project_id=15645
submit_dir=submission

narrative=${submit_dir}/${foa_id}-Technical-Narrative-${project_id}.pdf
abstract=${submit_dir}/${foa_id}-Technical-Abstract-${project_id}.pdf
capabilities=${submit_dir}/${foa_id}-Capabilities-${project_id}.pdf
benefits_of_collaboration=${submit_dir}/${foa_id}-Benefits-of-Collaboration-${project_id}.pdf

all: ${narrative} ${abstract} ${benefits_of_collaboration} ${capabilities}

${submit_dir}:
	mkdir ${submit_dir}

${abstract}: include/defs.tex abstract.tex
	pdflatex abstract.tex
	pdflatex abstract.tex
	mv abstract.pdf $@

${capabilities}: include/defs.tex capabilities.tex
	pdflatex capabilities.tex
	pdflatex capabilities.tex
	mv capabilities.pdf $@

${narrative}: include/acronyms.tex include/defs.tex narrative.tex narrative.bib
	pdflatex narrative.tex
	pdflatex narrative.tex
	pdflatex narrative.tex
	mv narrative.pdf $@

${benefits_of_collaboration}: include/defs.tex benefits_of_collaboration.tex 
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

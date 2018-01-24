# NEUP-template
A LaTeX template for NEUP proposals

## How to use this package

1. Update the data in `project-data.tex` to match your proposal
2. Add content to:
   * abstract.tex : Technical Abstract
   * benefits_of_collaboration.tex : Benefits of Collaboration
   * capabilities.tex : Capabilities
   * narrative.tex : Technical Narrative
3. Run the makefile: `make bib; make`
4. Files should be in the `submission` folder

## Manifest

This package contains template LaTeX files to generate the following 4 files
for an NEUP submission:

* abstract.tex : Technical Abstract
* benefits_of_collaboration.tex : Benefits of Collaboration
* capabilities.tex : Capabilities
* narrative.tex : Technical Narrative

The following files are also used:

* project-data.tex : includes the information unique to this proposal such as
  the title, PI, workscope, etc
* acronyms.tex : can be used for acronym expansion from the `glossaries`
  package; populated with USDOE acronym
* narrative.bib : bibtex file with references

The following files should not need to be changed unless you want to alter the
template:

* Makefile : manages the process of processing the files
* neup.sty : style file for NEUP format
* neup.bst : bibliography style file
* neup_logo.png : NEUP logo
* README.md : this file


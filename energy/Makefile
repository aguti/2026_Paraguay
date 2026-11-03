#TARGET=presentation
## make pdf by default
#all: ${TARGET}.pdf

#%.pdf : %.tex
	#pdflatex -shell-escape -enable-write18 $*
	#pdflatex -shell-escape -enable-write18 $*
##	pdflatex -shell-escape -enable-write18 $*
	##latex $*.tex
	##latex $*.tex
	##bibtex ${TARGET}
	##bibtex ${TARGET}
	##latex $*.tex
	##latex $*.tex
	##dvips -P pdf $*.dvi
	##ps2pdf $*.ps $*.pdf
#print:
	#pdflatex -shell-escape -enable-write18 presentation_print.tex


#clean:
	#rm -f ${TARGET}.{log,aux,ps,dvi,bbl,blg,log,toc,pdf}
	#rm -f ${TARGET}.log
	#rm -f ${TARGET}.aux
	#rm -f ${TARGET}.ps
	#rm -f ${TARGET}.dvi
	#rm -f ${TARGET}.bbl
	#rm -f ${TARGET}.blg
	#rm -f ${TARGET}.log
	#rm -f ${TARGET}.toc
	#rm -f ${TARGET}.pdf
	#rm -f ${TARGET}.nav
	#rm -f ${TARGET}.out
	#rm -f ${TARGET}.snm
	#rm -f ${TARGET}.pgf-plot.*
	#rm -f figs/*-converted-*


#PHONY : ps all clean reallyclean

TARGET= presentation_es
TARGET_TIKZ=tikz/tikz
FOLDER_TIKZ=tikz
# make pdf by default
all: ${TARGET}.pdf

# it doesn't really need the .dvi, but this way all the refs are right
%.pdf :  
	#latex ${TARGET}.tex
	#latex ${TARGET}.tex
	#latex ${TARGET}.tex
	##dvipdfmx ${TARGET}.dvi
	#dvips -P pdf $*.dvi
	#ps2pdf $*.ps $*.pdf
	make clean
	pdflatex -shell-escape -enable-write18 ${TARGET}.tex
	pdflatex -shell-escape -enable-write18 ${TARGET}.tex

	#pdflatex ${TARGET}.tex
	#pdflatex ${TARGET}.tex
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${TARGET}_noVideo.pdf ${TARGET}.pdf
${TARGET}.bbl: ./biblio.bib
# in case we don't already have a .aux file listing citations
# this should probably be a separate makefile target/dependency instead
# of doing it every time... but *shrug*
	latex ${TARGET}.tex
# get the citations out of the bibliography
	#bibtex ${TARGET}
# do it again in case there are out-of-order cross-references
	latex ${TARGET}.tex

${TARGET}.dvi: ${TARGET}.bbl ${TARGET}.tex
	latex ${TARGET}.tex

#shortcut, so we can say "make ps"
ps: ${TARGET}.ps

${TARGET}.ps: ${TARGET}.dvi
	dvips -t a4 ${TARGET}.dvi

videos:
	./video2image.sh

alldoc:
	make reallyclean
	make figures
	make videos
	make all

#Compiles all the tikz pictures
figures: 
	#latex -shell-escape -enable-write18 ${TARGET_TIKZ}.tex 
	#make -f ${TARGET_TIKZ}.makefile
	#rm -f ${TARGET_TIKZ}.aux
	#rm -f ${TARGET_TIKZ}.dvi
	#rm -f ${TARGET_TIKZ}.log
	#rm -f ${TARGET_TIKZ}.pdf
	cd ${FOLDER_TIKZ}; make

#Compile only a figure make figure a=NAME_FIG
figure:
	#latex -shell-escape -enable-write18 ${TARGET_TIKZ}.tex 
	#make -f ${TARGET_TIKZ}.makefile ${FOLDER_TIKZ}/$a.epsi
	#rm -f ${TARGET_TIKZ}.aux
	#rm -f ${TARGET_TIKZ}.dvi
	#rm -f ${TARGET_TIKZ}.log
	#rm -f ${TARGET_TIKZ}.pdf
	cd ${FOLDER_TIKZ}; make figure a=$a

clean:
	rm -f ${TARGET}.log
	rm -f ${TARGET}.aux
	rm -f ${TARGET}.ps
	rm -f ${TARGET}.dvi
	rm -f ${TARGET}.bbl
	rm -f ${TARGET}.blg
	rm -f ${TARGET}.toc
	rm -f ${TARGET}.out
	rm -f ${TARGET}.pdf
	rm -f ${TARGET}_noVideo.pdf
	rm -f ${TARGET}.nav
	rm -f ${TARGET}.snm

cleanfigs:
	rm -f ${FOLDER_TIKZ}/*.eps
	rm -f ${FOLDER_TIKZ}/*.dpth
	rm -f ${FOLDER_TIKZ}/*.dep
	rm -f ${FOLDER_TIKZ}/*.log

cleanfig:
	rm -f ${FOLDER_TIKZ}/$a.eps
	rm -f ${FOLDER_TIKZ}/$a.dpth
	rm -f ${FOLDER_TIKZ}/$a.dep
	rm -f ${FOLDER_TIKZ}/$a.log

cleanallfigs:
	rm -f ${TARGET_TIKZ}.figlist
	rm -f ${TARGET_TIKZ}.makefile
	rm -f ${FOLDER_TIKZ}/*.eps
	rm -f ${FOLDER_TIKZ}/*.dpth
	rm -f ${FOLDER_TIKZ}/*.dep
	rm -f ${FOLDER_TIKZ}/*.log

cleanall:
	rm -f ${TARGET}.log
	rm -f ${TARGET}.aux
	rm -f ${TARGET}.ps
	rm -f ${TARGET}.dvi
	rm -f ${TARGET}.bbl
	rm -f ${TARGET}.blg
	rm -f ${TARGET}.toc
	rm -f ${TARGET}.out
	rm -f ${TARGET}.nav
	rm -f ${TARGET}.snm
	rm -f ${TARGET}.pdf
	rm -f ${TARGET_TIKZ}.aux
	rm -f ${TARGET_TIKZ}.dvi
	rm -f ${TARGET_TIKZ}.figlist
	rm -f ${TARGET_TIKZ}.log
	rm -f ${TARGET_TIKZ}.makefile
	rm -f ${TARGET_TIKZ}.out
	rm -f ${TARGET_TIKZ}.pdf
	rm -f tikz_figs/*.eps
	rm -f tikz_figs/*.dpth
	rm -f tikz_figs/*.dep
	rm -f tikz_figs/*.log
	rm -f tikz_figs/*.md5
	rm -f figs/*converted-to*
	rm -f tikz_figs/*converted-to*
	rm -f ${TARGET}_noVideo.pdf
	rm -Rf `ls -1 -d mov/*/`


reallyclean: cleanall
	rm -f ${TARGET}.{ps,pdf}


#PHONY : ps all clean reallyclean

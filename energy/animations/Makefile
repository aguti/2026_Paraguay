#Compiles all the tikz animations
all: 
	pdflatex -shell-escape -enable-write18 smoothing.tex
	pdflatex -shell-escape -enable-write18 mufco_demo.tex
	pdflatex -shell-escape -enable-write18 load_scheduling.tex
	rm -f *.aux
	rm -f *.toc
	rm -f *.snm
	rm -f *.nav
	rm -f *.out
	rm -f *.figlist
	rm -f *.log
	rm -f *.makefile
	rm -f *.gnuplot
	rm -f *.table
	
#Compile only a figure make figure a=NAME_FIG
figure:
	pdflatex -shell-escape -enable-write18 $a.tex 
	rm -f *.aux
	rm -f *.toc
	rm -f *.snm
	rm -f *.nav
	rm -f *.out
	rm -f *.figlist
	rm -f *.log
	rm -f *.makefile
	rm -f *.gnuplot
	rm -f *.table

#Clean compilation stuff
clean:
	rm -f *.aux
	rm -f *.toc
	rm -f *.snm
	rm -f *.nav
	rm -f *.out
	rm -f *.figlist
	rm -f *.log
	rm -f *.makefile
	rm -f *.gnuplot
	rm -f *.table

default: crops

boards:
	find . -name "boards*.tex" | xargs -n 1 pdflatex

crops: boards
	find . -name "boards*.pdf" | xargs -n 1 pdfcrop

clean:
	rm *.pdf *~ *.log *.aux

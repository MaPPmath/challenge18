default: crops

boards:
	find . -name "boards*.tex" | xargs -n 1 pdflatex

explanations:
	find . -name "explanation*.tex" | xargs -n 1 pdflatex

boardcrops: boards
	find . -name "boards*.pdf" | xargs -n 1 pdfcrop

explanationcrops: explanations
	find . -name "explanation*.pdf" | xargs -n 1 pdfcrop

crops: boardcrops explanationcrops

clean:
	rm *.pdf *~ *.log *.aux

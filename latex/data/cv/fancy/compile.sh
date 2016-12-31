echo "Much fancier cv"
echo "Requires xelatex and biber"
echo "Not to mention some nice fonts..."
xelatex cv.tex
biber cv
xelatex cv.tex
rm *.aux
rm *.bcf
rm *.blg
rm *.out
rm *~
rm *.log
rm *.xml
rm *.bbl


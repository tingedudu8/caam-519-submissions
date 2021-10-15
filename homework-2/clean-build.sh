#!/bin/bash
echo "Please enter your proj name: "
read proj

file_name="$proj.tex"

touch "$file_name"

path=".build"
if [ -d "$path" ]
then
	echo "Directory exists"
else
	echo "No dir, creating..."
	mkdir .build
fi

cat >"$file_name"<<'THEEND'
\documentclass{article}
\begin{document}
hello world
\end{document}
THEEND

pdflatex "$file_name"

mv "$proj.aux" "$proj.tex" "$proj.log" .build




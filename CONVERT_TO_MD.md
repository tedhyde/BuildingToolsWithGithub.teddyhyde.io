```
$ for x in `ls *.asciidoc`; do asciidoctor -b docbook $x && pandoc -f docbook -t gfm $(basename $x '.asciidoc').xml -o $(basename $x '.asciidoc').md; done
```
`

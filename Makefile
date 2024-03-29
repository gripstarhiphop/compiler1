all: parser

test_parser.tab.c test_parser.tab.h: parser.y
	bison -t -v -d parser.y

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

parser: lex.yy.c parser.tab.c parser.tab.h
	gcc -o parser parser.tab.c lex.yy.c
	./parser TestProg.cmm

clean:
	rm -f parser lexer parser.tab.c lex.yy.c parser.tab.h parser.output
	ls -l

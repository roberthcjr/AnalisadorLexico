package src;

%%

%{
	private void imprimir(String descricao, String lexema){

		System.out.println(lexema + "-" + descricao);
	}
%}

%class AnalisadorLexico
%type void

program = program identifier body

body = [declare decl-list] begin stmt-list end

"decl-list" = decl {";" decl}*

decl = type ident-list

ident-list = identifier {"," identifier}*

type = integer | decimal

stmt-list = stmt {";" stmt}

stmt = assign-stmt | if-stmt | while-stmt

| read-stmt | write-stmt

assign-stmt = identifier ":=" simple_expr

if-stmt = if condition then stmt-list end

| if condition then stmt-list else stmt-list end

condition = expression

do-while-stmt = do stmt-list stmt-suffix

stmt-suffix = while condition

for-stmt = for assign-stmt to condition do stmt-list end //o for é opcional

while-stmt = while condition do stmt-list end // o while..do é opcional

read-stmt = read "(" identifier ")"

write-stmt = write "(" writable ")"

writable = simple-expr | literal

expression = simple-expr | simple-expr relop simple-expr

simple-expr = term | simple-expr addop term | "(" simple-expr ")" ? simple-expr ":" simple-expr

term = factor-a | term mulop factor-a

fator-a = factor | not factor | "-" factor

factor = identifier | constant | "(" expression ")"

relop = "=" | ">" | ">=" | "<" | "<=" | "<>"

addop = "+" | "-" | or

mulop = "*" | "/" | mod | and

shiftop = "<<" | ">>" | "<<<" | ">>>"

constant = digit {digit}*

literal = " “" {caractere} "”"

identifier = letter {letter | digit}*

letter = "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J"

| "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T"

| "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d"

| "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n"

| "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x"

| "y" | "z"

digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"

caractere = "~"

%%

"if"			{imprimir("Palavra reservada ", yytext());}
"then"			{imprimir("Palavra reservada ", yytext());}
{program}		{imprimir("Início do programa ", yytext());}
{body}			{imprimir("O corpo do programa ", yytext());}

. { throw new RuntimeException("Caractere invalido" + yytext()); }
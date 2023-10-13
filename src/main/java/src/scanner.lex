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

body = [declare declList] begin stmtList end

declList = decl (";" decl)*

decl = type identList

identList = identifier ("," identifier)*

type = integer | decimal

stmtList = stmt (";" stmt)

stmt = assignStmt | ifStmt | whileStmt | readStmt | writeStmt | doWhileStmt | forStmt

assignStmt = identifier ":=" simpleExpr

ifStmt = if condition then stmtList end | if condition then stmtList else stmtList end

condition = expression

doWhileStmt = do stmtList stmtSuffix

stmtSuffix = while condition

forStmt = for assignStmt to condition do stmtList end 

whileStmt = while condition do stmtList end 

readStmt = read "(" identifier ")"

writeStmt = write "(" writable ")"

writable = simpleExpr | literal

expression = simpleExpr | simpleExpr relop simpleExpr

simpleExpr = term | simpleExpr addop term | "(" simpleExpr ")" ? simpleExpr ":" simpleExpr

term = factorA | term mulop factorA

factorA = factor | not factor | "-" factor

factor = identifier | constant | "(" expression ")"

relop = "=" | ">" | ">=" | "<" | "<=" | "<>"

addop = "+" | "-" | or

mulop = "*" | "/" | mod | and

shiftop = "<<" | ">>" | "<<<" | ">>>"

constant = digit (digit)*

literal = " “" (caractere) "”"

identifier = letter(letter|digit)*

letter = [A-Z][a-z]

digit = [0-9]

caractere = "~"

%%


{program} {imprimir("Programa", yytext());}
{body} {imprimir("Corpo", yytext());}
{declList} {imprimir("Lista de declaração", yytext());}
{decl} {imprimir("Declaração", yytext());}
{identList} {imprimir("Lista de identação", yytext());}
{type} {imprimir("Tipos", yytext());}
{stmtList} {imprimir("Operações de repetição", yytext());}
{stmt} {imprimir("Operação de repetição", yytext());}
{assignStmt} {imprimir("Operação de atribuição", yytext());}
{ifStmt} {imprimir("Operação de condição", yytext());}
{condition} {imprimir("Condição", yytext());}
{doWhileStmt} {imprimir("Operação de DoWhile", yytext());}
{stmtSuffix} {imprimir("Sufixo da operação", yytext());}
{forStmt} {imprimir("Operação de repetição For", yytext());}
{whileStmt} {imprimir("Operação de repetição While", yytext());}
{readStmt} {imprimir("Operação de leitura", yytext());}
{writeStmt} {imprimir("Operação de gravação", yytext());}
{writable} {imprimir("Gravável", yytext());}
{expression} {imprimir("Expressão", yytext());}
{simpleExpr} {imprimir("Expressão simples", yytext());}
{term} {imprimir("Termo", yytext());}
{factorA} {imprimir("Fator A", yytext());}
{factor} {imprimir("Fator", yytext());}
{relop} {imprimir("Comparadores", yytext());}
{addop} {imprimir("Adição", yytext());}
{mulop} {imprimir("Multiplicação", yytext());}
{shiftop} {imprimir("Shiftop", yytext());}
{constant} {imprimir("Constante", yytext());}
{literal} {imprimir("String Literal", yytext());}
{identifier} {imprimir("Identificador", yytext());}
{letter} {imprimir("Letra", yytext());}
{digit} {imprimir("Digito", yytext());}
{caractere} {imprimir("Caractere Especial", yytext());}

. { throw new RuntimeException("Caractere invalido" + yytext()); }
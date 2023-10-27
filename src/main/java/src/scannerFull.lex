package src;

%%

%class AnalisadorLexico
%standalone
%line
%column

%{
      TabelaDeSimbolos tabela = new TabelaDeSimbolos();

      private void addToken(TiposDeToken type,String value) {
        tabela.novaEntrada(type,value,yycolumn, yyline);
      }
%}

letter = [A-Za-z]

digit = [0-9]

space = [ \t\n\r\f]
comment = "%"[^]*"%"

caractere = "~"
program = "program"
declare = "declare"
read = "read"
write = "write"
begin = "begin"
end = "end"
integer = "integer"
decimal = "decimal"
logic_op = "and"|"or"
rel_op = "<"|">"|"=="|"<>"|"<="|">="
assign = ":="
arit_op = "+"|"-"|"*"|"/"

identifier = {letter}({letter}|{digit})*
identList = {identifier}[","{identifier}]*
decl = {type}{identList}
declList = {decl}[";"{decl}]*
stmt = {assignStmt} | {ifStmt} | {whileStmt} | {readStmt}| {writeStmt}
stmtList = {stmt}[";"{stmt}]*
body = [{declare}{declList}]{begin}{stmList}{end}
fullProgram = {program}{identifier}{body}



%%

{space} {}
{comment} {System.out.print("Comentário "+ yytext() + "\n");}
{caractere} {System.out.print("Caractere Especial "+ yytext() + "\n");}
{program} {addToken(TiposDeToken.PALAVRA_RESERVADA_PROGRAM, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{begin} {addToken(TiposDeToken.PALAVRA_RESERVADA_BEGIN, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{end} {addToken(TiposDeToken.PALAVRA_RESERVADA_END, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{integer} {addToken(TiposDeToken.PALAVRA_RESERVADA_INTEGER, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{decimal} {addToken(TiposDeToken.PALAVRA_RESERVADA_INTEGER, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{identifier} {addToken(TiposDeToken.IDENTIFICADOR, yytext()); System.out.print("Identificador "+ yytext() + "\n");}

. { throw new RuntimeException("Caractere invalido" + yytext() + "\n"); }
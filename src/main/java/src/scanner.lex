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
caractere = "~"
identifier = {letter}({letter}|{digit})*
program = "program"
begin = "begin"
end = "end"
integer = "integer"
logic_op = "and"|"or"
rel_op = "<"|">"|"="|"<>"|"<="|">="
arit_op = "+"|"-"|"*"|"/"


%%

{space} {}
{caractere} {System.out.print("Caractere Especial "+ yytext());}
{identifier} {addToken(TiposDeToken.IDENTIFICADOR, yytext()); System.out.print("Identificador "+ yytext());}
{program} {addToken(TiposDeToken.PALAVRA_RESERVADA_PROGRAM, yytext()); System.out.print("Palavra Reservada "+ yytext());}
{begin} {addToken(TiposDeToken.PALAVRA_RESERVADA_BEGIN, yytext()); System.out.print("Palavra Reservada "+ yytext());}
{end} {addToken(TiposDeToken.PALAVRA_RESERVADA_END, yytext()); System.out.print("Palavra Reservada "+ yytext());}
{integer} {addToken(TiposDeToken.PALAVRA_RESERVADA_INTEGER, yytext()); System.out.print("Palavra Reservada "+ yytext());}

. { throw new RuntimeException("Caractere invalido" + yytext()); }
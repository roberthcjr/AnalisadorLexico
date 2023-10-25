package src;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;

public class TesteALex {

    public static void main(String[] args) throws IOException{

        File arquivoTeste = new File("./testes/teste1.txt");

        String teste = "program teste1\n";

        AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(teste));
        lexical.yylex();

    }

}
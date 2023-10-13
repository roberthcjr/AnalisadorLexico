package src;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;

public class TesteALex {

    public static void main(String[] args) throws IOException{

//        File arquivoTeste = new File("./testes/teste1.txt");

        String teste = "program teste1\n" +
                "declare\n" +
                "    integer a, b, c;\n" +
                "    integer result;\n" +
                "begin\n" +
                "    read (a);\n" +
                "    read (c);\n" +
                "    b := 10;\n" +
                "    result := (a * c)/(b + 5 % 345 -3) ;\n" +
                "    write(result)\n" +
                "end";

        AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(teste));
        lexical.yylex();

    }

}
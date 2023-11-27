package src;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.Scanner;

public class TesteALex {

    public static String readFileReturnString(String fileName) throws IOException {
        try {
            ClassLoader classLoader = TesteALex.class.getClassLoader();

            File arquivo = new File(classLoader.getResource(fileName).getFile());

            Scanner scanner = new Scanner(arquivo);

            StringBuilder conteudo = new StringBuilder();

            while (scanner.hasNextLine()) {
                conteudo.append(scanner.nextLine()).append("\n");
            }

            scanner.close();

            return conteudo.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileName;
    }
    public static void main(String[] args) throws IOException{

        String teste = readFileReturnString("teste4.txt");

        AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(teste));
        lexical.yylex();

    }


}
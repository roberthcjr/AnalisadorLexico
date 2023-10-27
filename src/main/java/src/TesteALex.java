package src;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.Scanner;

public class TesteALex {

    public static String readFileReturnString(String filePath) throws IOException {
        try {
            File arquivo = new File(filePath);

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
        return filePath;
    }
    public static void main(String[] args) throws IOException{

        //Necessário pegar o absolute path
        String teste = readFileReturnString("/home/robert/Workspace/Faculdade/AnalisadorLexico/src/main/java/src/testes/teste4.txt");

        AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(teste));
        lexical.yylex();

    }


}
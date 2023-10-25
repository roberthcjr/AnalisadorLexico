package src;
import jflex.base.Pair;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java_cup.runtime.*;

public class TabelaDeSimbolos {

    private HashMap<String,Token> tabela;

    public TabelaDeSimbolos() {
        tabela = new HashMap<>();
    }

    public void novaEntrada(TiposDeToken type, String valor, int column, int line) {
      Token novoSimbolo = new Token(type,  valor , line, column);
      adicionarSimbolo(valor, novoSimbolo);
    }

    private void adicionarSimbolo(String valor, Token novoSimbolo) {
        tabela.put(valor, novoSimbolo);
    }


}

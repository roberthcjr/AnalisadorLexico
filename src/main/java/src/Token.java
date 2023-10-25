package src;
public class Token {

    TiposDeToken tipo;
    String valor;
    int linha;
    int coluna;

    Token (TiposDeToken tipo, String valor, int linha, int coluna) {
        this.tipo = tipo;
        this.valor = valor;
        this.linha = linha;
        this.coluna = coluna;
    }
}

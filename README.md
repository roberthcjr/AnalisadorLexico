# AnalisadorLexico

Projeto de um analisador léxico como projeto da disciplina de compiladores

## Como executar

Definimos duas formas de executar o programa,

1. Pela IDE IntelliJ onde basta mudar no aquivo ``TesteALex`` o valor da variável ``FILE_NAME`` para um dos respectivos testes, exemplo:
```java
static String FILE_NAME = "testeX.txt"
```
2. Executando o ```.jar``` pelo terminal, passando o nome de um dos arquivos de teste como argumento, primeiro execute o maven com o comando:
```bash
 mvn clean package
```
  Em seguida basta rodar o comando usando um dos nomes dos aquivos:
```bash
java -jar target/analisador-lexico-jar-with-dependencies.jar <arquivo>.text
```
  Pode também usar a opção ``all`` para rodar todos os aruivos presentes de uma vez:
  ```bash
java -jar target/analisador-lexico-jar-with-dependencies.jar all
```

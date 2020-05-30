# language: pt
# utf-8

@funcional
Funcionalidade: Abrir nova janela à partir de um link de acesso

  - Eu, como testador, desejo abrir uma nova janela / aba
    à partir de um link disponibilizado na página
    de origem.
  - A nova janela / aba deverá apresentar uma url diferente
    da janela / aba de origem.

@smoke
Esquema do Cenário: Validar uma nova janela à partir de um link
  Dado que eu estou na página Windows
  Quando eu clico no link disponibilizado na página
  Então a nova página deverá ser apresentada com o caminho <caminho>
  Exemplos:
  | caminho        |
  | "/windows/new" |
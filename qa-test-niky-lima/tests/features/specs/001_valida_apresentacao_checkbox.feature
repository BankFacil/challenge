# language: pt
# utf-8

@funcional
Funcionalidade: Validação dos elementos dinâmicos da página Dynamic Controls

  - Eu, como testador, gostaria de validar na página Dynamic Controls
    o comportamento de seus elementos.
  - O botão Remove, após o clique, deverá tornar o checkbox da tela invisível,
    o seu título deverá ser alterado para Add e a frase It's gone! terá que
    ser apresentada.
  - Ao clicar *NOVAMENTE*, agora no botão Add, o checkbox deverá ficar visível
    e a frase a ser apresentada será It's back!

Esquema do Cenário: Validar a ocultação do checkbox na página Dynamic Controls
  Dado que eu estou na página Dynamic Controls
  Quando eu clico no botão dinâmico
  Então o checkbox deverá estar invisível
  E a frase <frase> deverá ser apresentada
  Exemplos:
  | frase        |
  | "It's gone!" |

Esquema do Cenário: Validar a apresentação do checkbox na página Dynamic Controls
  Dado que eu estou na página Dynamic Controls
  Quando eu clico no botão dinâmico
  Então o checkbox deverá estar invisível
  Quando eu clico no botão dinâmico
  Então o checkbox deverá estar visível
  E a frase <frase> deverá ser apresentada
  Exemplos:
  | frase        |
  | "It's back!" |
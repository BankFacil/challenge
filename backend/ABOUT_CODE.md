__Explicação do Backend Challenge__

A primeira coisa que fiz foi retirar tudo do arquivo bootstrap.kt e separar tudo em pacotes e classes. 
Eu nunca havia codificado em Kotlin, então imaginei que seria mais fácil de visualizar tudo.

Estruturei os pacotes de forma a separar o objetivo de cada classe no projeto:
  - model: pacote designado ao modelo dos dados que será operado.
      - type: pacote designado para ENUM.
  - service: funcionalidades que possuem a regra de negócio do projeto.

Algumas alterações foram feitas nas classes do model, mas foi apenas para compôr as características dos steps que 
envolviam e-mail para _customer_ e _labels_.

Existem quatro tipos de produtos e com características distintas de envio, então criei quatro tipos de envio, sendo que
todos teriam a mesma estrutura de envio, porém com "_steps_" diferentes em sua implementação. O objetivo era ter uma
manutenção menos custosa futuramente e manter um certo padrão de tudo que é envio de produto.

Implementei funções isoladas para as características que eram exclusivas do envio. Minha pretensão era ter mais uma 
camada de abstração do shipping label para eliminar a função, e sim na construção do objeto eu já atribuir essa 
característica, porém foquei em estruturar os outros steps.

A orquestração ficou em _Order_, porque honestamente as informações de _customer_ e _product_ estavam "na mão".

Implementei alguns testes unitários em cima da classe Order tambem utilizando _kotlin-test_.
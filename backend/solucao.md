# Explicação da Solução

Para esse problema é importante levar em consideração que o código gerado deve seguir os princípios SOLID para que o sistema possa ser facilmente compreendido, extensível e com fácil manutenção do código.

## Ambiente de desenvolvimento

A solução foi desenvolvida utilizando Kotlin com a ajuda da IDEA IntelliJ. Os testes unitários estão escritos usando Mockk 1.9 e JUnit 5.

## Organização do projeto

Primeiramente busquei separar as classes em diferentes arquivos, agrupando-as conforme sua funcionalidade, por exemplo, as classes e interfaces relacionadas ao objeto produto foram transferidas para o arquivo Produto.kt.

## Orientação a objeto

O segundo passo foi abstrair os diferentes tipos de produtos em classes diferentes para comportar as diferenças de comportamento para cada tipo de produto (Físico, livro, mídia, etc). Cada produto possui a sua própria forma de ser entregue e por isso a interface `Product` obriga que todos os produtos tenha a função `getDeliveryRule` para retornar o objeto que será responsável por fazer a entrega do produto. Dessa forma as regras de entrega podem ser estendidas conforme novas regras de negócio surgem.

As regras de entrega (`DeliveryRule`) são definidas por interface que garante que toda regra pode ser processada através da função `deliver`, é dentro dessa função que as diferentes regras de negócio serão implementadas. Além disse criei outras interfaces como `ShippableInterface`, `NotifyInterface` e `GnerateVoucherInterface` para garantir que as classes de entrega tenham as funções necessárias para cada cenário.

Também criei classes para gerenciar o envio de notificações e criação do shipping label e notificações para o cliente. Essas classes estão simples apenas para explicar o que poderia ser feito relação a essa parte do sistema, de forma que também seguisse as boas práticas da orientação a objeto.

## Tests

Para finalizar escrevi testes unitários focados apenas na verficação do fluxo de informações no sistema, isto é, apenas validando se as funções estão sendo executadas conforme o esperado.
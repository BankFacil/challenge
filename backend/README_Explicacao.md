# Explicação

 - Criei uma nova pasta "*project*" dentro de "*backend*" onde contém todas as classes do projeto;
 - Usei como base o arquivo "*bootstrap.kt*" para separar todas as classes em arquivos e packages diferentes;
 - Ao invés de utilizar a classe ProductType para identificar o produto, achei melhor criar uma abstração de produto e usar a herança nos tipos de produto;
 - Utilizei o pattern *Strategy* para que cada produto tivesse a sua implementação de como deveria ser feito o checkout/envio do pedido;
 - Criei a classe "*SendEmail*" que será responsável para enviar todos os emails da aplicação.


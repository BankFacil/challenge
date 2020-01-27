## Solução - Desafio para Backend Software Engineer

Para solucionar o desafio realizei os seguintes passos:

* Foi criada uma classe abstrata para representar a remessa (Shipping) ela implementa métodos padrões que podem ser usados por suas respectivas filhas (impressão de etiquetas, envio de e-mails, etc);
* Para cada tipo diferente de remessa, foi criada uma classe concreta estendendo a classe Shipping. Elas implementam o método 'dispach' cada uma a sua maneira, utilizando métodos da classe pai ou não;
* Posteriormente foi criada uma classe factory (ShippingFactory), esse cara é responsável por retornar a instância correta de cada remessa, de acordo com o tipo de produto;
* Dentro da classe Order, foi criada uma nova função (dispathItems()) para percorrer os itens de produto e chamar o despacho de cada um utilizando a ShippingFactory
* Dentro da classe main, bastou chamar a nova função 'dispathItems()' para despachar todos os itens.

Dessa maneira, o programa não precisa saber o tipo de instância de Shipping que ele está despachando e, na necessidade de implementar novos tipos de remessas para produtos diferentes, basta criar uma nova classe filha de Shipping, implementar suas devidas regras e adicionar na factory.


 

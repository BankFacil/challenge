## Apresentação do desafio para Backend

Criei um novo diretório chamado **backend-fabricio** para implementar a solução do desafio.

Com base no que está sob avaliação eu implementei o que foi pedido e não me concentrei em manter alguns membros das entidades do bootstrap.

Dentro da pasta **src/main/kotlin** eu criei dois pacotes para representar as agregrações **Order** e **Shipping**.

Para o fluxo dos pagamentos criei uma classe abstrata **Product** e com base nela criei as classes derivadas para cada produto **(Physical, Membership, Book e Digital)**.

Cada produto implementa a sua forma de pagamento e regras de envio. O `shipping label` é gerado atráves da classe **ShippinLabel** e as notificações são feitas atráves da classe **NotificationService**. Estas classes pertencem a agregação **Shipping**.

Quando é realizado um pagamento de um produto é adicionado um evento informando que aquele produto foi pago para o pedido em questão. Este evento é adicionado a uma lista de eventos para ao fim do processo de pagamento serem executados. A classe responsável por manter esses eventos e executa-los é a **OrderPaymentEventContainer** (Em uma aplicação da vida real este container deve ser thread-safe). Existe um controle para que um evento não seja adicionado mais de uma vez para o mesmo pedido.

A service **PaymentService** é responsável por orquestrar os pagamentos para um pedido.

Para o teste criei quatro métodos para atender os seguintes cenários:

- Não é possível criar um pedido sem item
- Não é possível criar um pedido com item duplicado
- O desconto para o cliente só deve ser aplicado uma vez, ou seja, se o cliente comprou dois ou mais produtos de mídia digital ele só deve receber R$10,00 de desconto
- Informar o necessário para que o pedido seja criado com sucesso

A implementação ficou basicamente essa. Obrigado pelo desafio! 😉
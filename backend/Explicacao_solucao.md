- bootstrap.rb
Neste arquivo ficaram os testes realizado na aplica��o, junto ao require File.expand_path para separar a arquitetura, assim pude chamar apenas um arquivo o "compra_online.rb" para incluir as demais classes no projeto.

- compra_online.rb
Classe respons�vel por apenas chamar todas as classes existente na aplica��o. Desta forma posso adicionar todas as classes e chamar apenas uma classe no momento da execu��o do software.

- customer.rb
Dentro da classe customer fiz uma modifica��o para n�o precisar utilizar a classe de assinatura neste momento (membership) pois como s� seria ativa��o (true ou false) n�o faz muito sentindo vincular uma classe a isso, muito embora em um momento futuro em alguma implementa��o maior na assinatura seria necess�rio uma classe.
Outra modifica��o realizada foi a inser��o do address para o customer, imaginei como um app do mercado livre onde o usu�rio possui o endere�o de entrega. Mas poderia existir uma outra implementa��o para inserir o address na entrega do pedido criando duas possibilidades para o usu�rio. Como esta aplica��o � simples, para n�o precisar preencher diversas vezes o endere�o escolhi inserir no customer.
Escolhi deixar o attr_accessor para assinatura pois ser� um atributo que ter� um set em tempo de execu��o de acordo com a condi��o.

- email.rb
Optei por criar uma classe de email que fique respons�vel pelo envio de email, possuindo os respectivos atributos: email, assunto, texto e arquivo que ser� enviado, entretanto, existe uma outra forma caso fosse um sistema de envio mais elaborado, podendo criar uma classe de emailservice que ficaria respons�vel apenas pelas formas de envio, podendo o email ser apenas para adicionar os atributos.

- order.rb
Na classe order retirei o endere�o e adicionei o metodo de product que retorna o produ��o presente dentro do map e outro metodo que retorna o produto de acordo com o seu tipo.

- payment.rb
A classe de pagamento possui diversos metodos entretanto, fiz o m�ximo para que ficasse separado as responsabilidades de cada pagamento.
Como o sistema possui algumas regras para o pagamento decidi criar mais 4 classes de pagamento que possuem suas respectivas regras e responsabilidades.
A classe de pagamento ser� a respons�vel apenas por decidir a forma que o produto ser� pago, direcionando o pagamento de acordo com o tipo do produto.

- payment_book.rb
Dentro da classe de pagamento de livro ficou o pagamento chamando um shipping label com as informa��es da compra.

- payment_digital.rb
O pagamento digital possui algumas regras s�o elas: enviar um email com as informa��es do produto pelo assunto e ap�s isso criar para o usu�rio um voucher de desconto de 10 reais.

- payment_physical.rb
O pagamento f�sico possui a gera��o de um shipping label ao realizar o pagamento.

- payment_signature.rb
O pagamento de assinatura possui as regras de ativar a assinatura no momento do pagamento e enviar um email para o usu�rio assinante.

- shipping_label.rb
A classe de shipping label possui apenas uma regra de exibir a mensagem que o item da compra � isento de impostos caso o atributo tribute seja igual a true.

- voucher.rb
A classe de voucher ter� apenas o desconto como atributo podendo ser settado de acordo com a regra.
Escolhi o atributo como attr_acessor pois ser� setado em tempo de execu��o.

 
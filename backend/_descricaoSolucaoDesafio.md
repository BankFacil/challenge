## Descrição do solução do desafio:
	
### Fluxo do Codigo:
	
		1. No primeiro contato, separei as classes do arquivo bootstrap.py. Cada uma em um arquivo para entender e criar o fluxo do codigo.

		2. Tentei imaginar como ocorre o fluxo de compra em um site ecommerce da mesma forma que usamos hoje em dia:
			- Logamos/Criamos nossa conta; 
			- Passamos nossas informações;
			- Escolhemos os produtos que queremos;
			- adicionamos ele ao "carrinho";
			- fechamos o "carrinho";
			- efetuamos o pagamento.

		3. Uma vez imaginada essa ordem podemos ver como se da execucao do codigo atraves do main.py:

			Customer() -> cria o usuario da conta/compra (pega as informaçoes necessarias);
			OrderItem() -> cria o produto na prateleira;

			OrderTotal() -> cria o pedido geral do usuario;
			putOnCart() -> descreve a ação de colocar determinado produto no carrinho:
			Payment() -> efetua o pagamento da compra;
			pay() -> faz a trasação do fecha a ordem e dispara a ação de envio dos produtos;
			isPaid() -> retorna codigo de confirmaçao se o produto foi pago.
			
### Implementação da Classe Product():

	A classe Product foi projetada para receber uma lista de produtos separa-los por tipo e disparar a entrega conforme o tipo atraves da classe SenderOrder().
	A classe SenderOrder() define a estrategia de envio (estrategias implementadas em ** deliveryStrategy.py **) para cada tipo de produto de acordo com especificacao inicial proposta pelo descritivo da tarefa.
	Vale a pena ressaltar que foi a estragia mais dificil de implementar, uma vez que python nao suporta sobrecarga de metodo. Caso fosse possivel, poderiamos um metodo com assinaturas diferentes e ações para cada type de produto. Sendo que cada type poderia ser tipo novo de variavel. (typedef em C++).
	
### Implementação classe Payment():
	É a classe que faz o pagamento da compra e é onde o valor da compra final é atualizado. Caso o usuario tenha o voucher de desconto, ele entraria com esse voucher nas informaçoes para ativar a "flag" de desconto e ter o desconto de $10.00 no total final da compra.
	
### Implementação classe Customer():
	Classe que cria o usuario da compra.


	

	

	
	
		
		

		
		



  

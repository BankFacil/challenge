## Explicação da Solução - Desafio para Backend Software Engineer 

__O que foi utilizado para no desenvolvimento do desafio?__

O desafio foi realizado em Kotlin, utilizando a IDE IntelliJ (que gerou a pasta [.idea]).

__Quais abordagens foram utilizadas para desenvolvimento da aplicação?__

Após entendimento da aplicação, realizei a reestruturação e implementação das novas funcionalidades utilizando DDD e Arquitetura Hexagonal, os códigos da aplicação encontram-se na pasta [src] e os testes implementados na pasta [tests].

__Sobre os testes__

Para desenvolvimento dos testes foi utilizado JUnit, as libs de referência encontram-se na pasta [libs].
Nos testes o foco foi garantir que as classes que contém a implementação das novas funcionalidades, assinava todas as interfaces necessárias para que cumprisse o objetivo definido no desafio, e também garantir o fluxo de execução de um pedido (foi alterado o local da chamada do método [close] na classe [Order]).

__Observações__

- Eliminei o arquivo bootstrap.kt, criando no lugar dele o arquivo [src/main.kt].

- Dentro do arquivo inicial [src/main.kt], foi incrementada a chamada do método [deliver] da classe [Order] que realiza a entrega do pedido.

- Alterei o local da chamada do método [close] na classe [Order], sendo realizada após a entrega dos itens do pedido.

- Temos três pastas principais na aplicação [src], sendo elas:
	- [src/adapter] : classes concretas que interagem com o que não é o ([core])negócio da aplicação (envio de e-mail, filas, bds...)
	- [src/ports] : interfaces que disponibilizam integração entre o ([core])negócio da aplicação e suas implementações concretas que podem ser estar ou não. dentro do core.
	- [src/core/...] : toda os models e implementações das regras de negócio da aplicação, separadas por dominio.
	- [src/config] : configurações da aplicação 

- Como não foi utilizado nenhum framework, dentro da pasta [src/config] criei uma classe [DependenciesConfig] que expõe os objetos que seriam correspondentes a [beans], que disponibilizam uma implementação de uma classe / funcionalidade especifica para injeção de dependência em alguns objetos, com isso, facilita a mudança de alguma funcionalidade (caso necessário), como exemplo, para mudança da implementação do envio de e-mails, seria somente necessário nessa classe alterar o tipo de objeto retornado no metodo [MailSender()], que refletiria a alteração da funcionalidade para todos os objetos que o utilizam como dependência.

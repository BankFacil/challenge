# Desafio QA Creditas

 ## 1. Especificação da tela de login
* Especificação do cenário de Login do site da Creditas está no arquivo "Especificacoes.feature".

 ## Explicação da Solução proposta 

* Especificações realizadas em BDD;
* Padrão PageObjects implementado;
* Não foi utilizado capybara e sitePrism;


 ## Adionar e remover checkbox

* O site em si não fornece opções para boas práticas de desenvolvimento, como ausência de ids
* Foi utilizado navigation, para começar o cenário seguinte sem dependência de outro.


 ## 1.2 Nova aba

* Assim como no exemplo de adicionar e remover checkbox, o site nãod disponibiliza opções para boas práticas de desenvolvimento.

 ## Post utilizando API

* Não foi utilizado BDD para criação do teste de API, pois particularmente eu não vejo agregar valor ao uso de API com BDD.
* Foram validados os response.code e o responde.message.

## Para execução

* Bundle install
* cucumber feature/featurename - Para os testes em BDD
* rspec API.rb - para o teste de API
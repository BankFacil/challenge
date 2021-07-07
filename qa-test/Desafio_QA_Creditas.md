# Desafio QA Creditas

Para dar continuidade no processo seletivo para a vaga de QA na Creditas resolvi o desafio do site (https://github.com/priscilasanfer/challenge/tree/master/qa-test).

O desafio deveria levar entre 4 a 8 horas, entretanto no desenvolver dos testes me deparei com algumas dúvidas quanto as melhores práticas na resolução do exercícios. 

## 1. Especificação da tela de login
* O detalhamento da especificação do cenário de Login do site da Creditas está no arquivo "login.feature".

## 2. Solução Automação dos Testes 

* Projeto realizado utilizando Ruby versão 2.4.2.
* Especificações realizadas em BDD.
* Implementado relatório com screenshot das evidências dos testes.
* Implementado a opção de execução dos testes no Chrome e Firefox. Por padrão o projeto rodará no Firefox, caso deseje utilizar o Chrome basta mudar o paramento -p no arquivo cucumber.yml.
* Padrão PageObjects implementado.
* Adicionada a opção de ignorar o log e screenshots dos testes. Entretanto para efeito de validação essa opção foi comentada e os arquivos enviados. Para futuros envios caso não queira enviar para o github novos relatórios basta desmarcar os comentários.
* Foi utilizado um hook para que as classes dos PageObjects sejam instanciadas e utilizadas mais facilmente em qualquer lugar caso seja necessário. 


## 1.1 Adionar e remover um checkbox

**Objetivo**: Criar um cenário de teste automatizado para adicionar e outro para remover o checkbox. Fazer validações necessárias para garantir que o checkbox foi corretamente adicionado/removido.

**Resolução**
* O site fornecido contém algumas limitações quanto a utilização de boas práticas no desenvolvimento dele, faltando melhores opções para identificar os elementos. 
* Único botão tanto para adicionar ou remover o checkbox, só o texto era alterado.
* Os cenários não podem ter dependências, por isso na hora de adicionar novamente o checkbox foi necessário primeiro desativá-lo.
* O checkbox é realmente removido da DOM por isso a validação foi feita vendo se o elemento ainda existe. 
* Por falta de melhores opções de identificação dos elementos as ações de adicionar/remover o checkbox foram realizadas como métodos no PageObjects. 


## 1.2 Nova aba

**Objetivo**: Criar um cenário de teste automatizado que clique em link e valide que uma outra aba foi aberta corretamente.

**Resolução**
* Listei os elementos que iria precisar no PageObject.
* Fiz as ações no de clique e mudança de foco no PageObjects e as esperas por elementos e verificações no steps_definitions.


## 1.3 Post utilizando API

**Objetivo**: Criar um teste que envia uma requisição post através da API. Validar que o post foi criado através do response code e do response body.


**Resolução**
* Transformei os dados de entrada em um hash.
* Fiz a requisição post transformando o body para um JSON.
* Fiz a validação para o response code da API
* Verifiquei que os dados enviados foram mesmo armazenados na API comparando os campos.


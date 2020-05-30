# Sobre o Código

Aqui explicarei sobre o padrão adotado para o desenvolvimento. Também abordarei sobre as gems utilizadas.

Bem, já conhecendo a estrutura e como o desafio pedia, foi adotado o padrão de Page Object e o conteúdo das pastas estão dispostos da seguinte forma:

- Na pasta **pages** nós temos as classes responsáveis por agrupar os elementos de página e suas ações como por exemplo:

```
element :button, 'button[name="btnClickHere"]'

def do_something
  button.click
end
```

- Na pasta **step_definitions** nós temos o *Cucumber*, responsável por intermediar a comunicação entre a especificação e as pages (páginas).

Exemplo:

```
Dado('que eu clico no botão da página') do
  --faz alguma coisa--
end
```

- E na pasta **specs** nós temos o *Gherkin*, que nada mais é que nosso *BDD*, ou seja, o que vai traduzir nosso código / lógica em especificação.

Exemplo:

```
Funcionalidade: Validar se o botão apresentado na página funciona

Cenário: Validar o clique do botão da página
  Dado que eu clico no botão da página
  Então ele deverá responder ao estímulo
```

- Na pasta **support** temos alguns arquivos que também são importantes:
- O **env.rb** tem como papel ajustar o relatório e utilizando o *Capybara*, configurar os navegadores que serão utilizados no projeto;
- O **helper.rb** é a classe responsável por organizar alguns facilitadores. No caso desse projeto, ela contém um método para *gerar evidências em .png*;
- O **hooks.rb** possui funções capazes de executar algo antes ou depois de um cenário ou funcionalidade, pode possuir 2 funções pré-estabelecidas que são o *Before* e o *After*;
- O **page_helper** é um gerenciador de *pages*, basicamente a sua responsabilidade é tornar esses objetos globais, para que possam ser usados sem que necessitemos criar novas instância demasiadamente;
- O **settings** é uma classe que está responsável por configurar as *urls* e *uris* e inicializar a instância do navegador. Foi criada com o intuito de diminuir a reescrita para essas configurações acima referidas... A idéia também é diminuir a criação de instâncias utilizando-se do objeto diretamente.

### Falando sobre as GEMS

Vou deixar aqui uma breve explicação sobre as gems adotadas nesse projeto:

- __capybara__
       - Basicamente é uma implementação do Selenium para Ruby, nosso motor para testes ponta-a-ponta.

- __chromedriver-helper__
       - O driver do navegador Google Chrome.

- __cucumber__
       - O interoperador da lógica com o Gherkin.

- __cucumber-json__
       - Gerador de .json baseado nas especificações (Gherkin). Fonte para os relatórios.

- __faker__
       - Um gerador de dados falsos/sintéticos que facilita a geração de massa para testes.

- __geckodriver-helper__
       - O driver do navegador Mozilla Firefox.

- __httparty__
       - Biblioteca para testes de API. [Link para Testando_a_API](../explanation/API.md)

- __report_builder__
       - Biblioteca que gera um leve relatório com os testes executados.

- __rspec__
       - Framework BDD com uma sintaxe bem fluída e bom recursos para a realização de testes.

- __selenium-webdriver__
       - O motor de drivers. O pacote de soluções primordial para qualquer teste ponta-a-ponta.

- __site_prism__
       - Um facilitador para a aplicação do Page Object, com bons recursos para testes - inclui bons validadores e redutores de verbosidade.

## [Ir para o README](../README.md)


# Desafio para QA - Test Engineer

## Instalação

`git clone git@github.com:fernandacezario/challenge.git`

## Utiliza

Ruby, Capybara, Selenium Webdriver, Cucumber e HTTParty.

Nota: Utilizar o Firefox na versão **47.0.1** com o **geckodriver** (https://github.com/mozilla/geckodriver/releases)
      E utilizar o site_prism na versão **2.5**
      E utilizar o HTTParty na versão **0.16.2**

## Capybara
Ajuda você a testar aplicativos da web simulando como um usuário real interage com o mesmo.

## Selenium Webdriver
É um frame de automação de navegador e seu ecossistema.

## Cucumber
É uma ferramenta que suporta Behavior-Driven Development (BDD) - um processo de desenvolvimento de software que visa melhorar a qualidade do software e reduzir os custos de manutenção.
Executa especificações escritas em linguagem simples e produz relatórios indicando se o software se comporta de acordo com a especificação ou não.
Reduz o esforço para manter as especificações de requisitos, testes e documentação em sincronia, podendo ser uma única fonte de documentação para todos na equipe.

## HTTParty
O HTTParty é uma nova biblioteca Ruby, criada por John Nunemaker, que facilita criar classes que podem usar APIs baseadas na Web e serviços relacionados.

## Contribuição
1. Fork it!
2. Criar um branch: `git checkout -b my-new-feature`
3. Comitar suas mudanças: `git commit -am 'Add some feature'`
4. Enviar para o GitHub: `git push origin my-new-feature`
5. Abrir um PR :D

## Execução
Para executar os cenários:
`cucumber features/{name_file_feature.feature}`

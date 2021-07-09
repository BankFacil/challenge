# Shopitas em ruby

## Como executar

- Instale o ruby (na minha máquina usei a versão 2.5.0)
- `cd ruby/`
- `gem install bundle`
- `bundle install`
- `parallel_test tests/*` Para executar os testes de unidade
- `ruby user_interface/main.rb ` Para executar a aplicação de console

## Explicação da solução

O projeto foi separado uma arquitetura em camadas, deixando para o projeto de infraestrutura apenas as responsabilidades relativas a implementações de baixo nível (Princípio de inversão de controle, eg. enviar e-mails e imprimir etiquetas de envio). Nesta arquitetura o projeto de domínio representa as regras do negócio. A camada de aplicação orquestra a interação entre infra e domínio expondo uma api (application programable interface) para as interfaces de usuário (UI), deixando bem fácil criar novas UIs utilizando esta camada de aplicação.

Desenvolvi uma aplicação usando algumas práticas de *Domain Driven Design (DDD)*, sendo elas: linguagem ubíqua e entidades. A solução foi elaborada na sua maioria usando *Test Driven Development (TDD)*. Usei também algumas técnicas de refatoração para encapsular melhor as responsabilidades dos métodos dando nomes mais legíveis e condizentes com o negócio, consequentemente possibilitando uma melhor leitura e manutenibilidade do código.
    
Basicamente usei *Order* como raiz de agregação (ponto de entrada para fazer uma compra) e encapsulei as regras específicas de envio de cada produto com classes que estão na pasta *post_payment_actions*, usando um dicionário (hashmap) para escolher em tempo de execução qual classe deve ser utilizada dependendo do tipo do produto.

Para um melhor entendimento visualize os testes do projeto.

## Prós

- Código legível
- Amplamente testado
- Documentado com testes de unidade
- Fácil manutenção
- Alta coesão
- Facilidade para novas interfaces de usuário a partir por causa da camada de aplicação
- Desta vez fiz o exercício na linguagem da empresa

## Contras

- Arquitetura complexa (muitas camadas, muitos arquivos, tests)
- Pra adicionar um *PostPaymentAction* é necessário adicionar uma entrada no dicionário da *pay_order*
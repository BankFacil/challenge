# Shopitas em C\#

## Como executar

- Instale o [.NET Core SDK 2](https://www.microsoft.com/net/download)
- `cd csharp/Shopitas.UnitTests.Domain`
- `dotnet test` Para executar os testes de unidade
- `cd ../Shopitas.UI`
- `dotnet run` Para executar a aplicação de console

## Explicação da solução

Desenvolvi uma aplicação usando algumas práticas de *Domain Driven Design (DDD)*, sendo elas: arquitetura orientada a eventos, linguagem ubíqua, entidades e objetos de valor. A solução foi elaborada na sua maioria usando *Test Driven Development (TDD)*. Usei também algumas técnicas de refatoração para encapsular melhor as responsabilidades dos métodos dando nomes legíveis e significativos pro negócio e consequentemente possibilitando uma melhor leitura e manutenibilidade do código.

O projeto foi separado uma miniarquitetura em camadas (faltou a camada de aplicação), deixando para o projeto de infraestrutura apenas as responsabilidades relativas a implementações de baixo nível (Princípio de inversão de controle, eg. enviar e-mails e imprimir etiquetas de envio). Nesta arquitetura o projeto de dominio representa as regras do negócio.
    
Basicamente usei *Order* como raiz de agregação (ponto de entrada para fazer uma compra) e encapsulei as regras específicas de envio de cada produto com classes que herdam de *PostPaymentActions*, usando um dicionário (hashmap) para escolher em tempo de execução qual classe deve ser utilizada dependendo do tipo do produto.

Para um melhor entendimento basta visualizar os testes do projeto.

## Prós

- Código legível
- Amplamente testado
- Documentado com testes de unidade
- Fácil manutenção
- Alta coesão
- Baixo acomplamento (obtido com a arquitetura orientada a eventos)

## Contras

- C# não é a linguagem principal de vocês
- Arquitetura complexa (muitas camadas, muitos arquivos, tests)
- Pra adicionar um *PostPaymentAction* é necessário adicionar uma entrada no dicionário de *PostPaymentActions*

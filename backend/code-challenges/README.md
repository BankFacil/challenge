# Desafio de Código

A proposta da aplicação que vamos desenvolver em conjunto é disponibilizar a uma pessoa as modalidades de empréstimo as quais ela tem acesso de acordo com algumas variáveis.

Devemos prover os seguintes modelos de empréstimo:

- Empréstimo pessoal (`personal_loan`). Taxa de juros: 4%
- Empréstimo com garantia (`collateral_loan`). Taxa de juros: 3%
- Empréstimo consignado (`payroll_loan`). Taxa de juros: 2%

Abaixo seguem as regras de negócio relacionadas a concessão de empréstimo de acordo com o perfil da pessoa:

|                              | Empréstimo pessoal | Empréstimo c/ garantia | Consignado |
| ---------------------------- | ------------------ | :--------------------: | ---------- |
| Salario `<= 3000`            | Sim                |       Sim\*\*\*        | Não        |
| Salario `> 3000` e `< 5000`  | Sim                |        Sim\*\*         | Não        |
| Salário `=> 5000`            | Sim                |         Sim\*          | Sim        |

- \* Clientes com menos de 30 anos
- \*\* Clientes que residem em SP
- \*\*\* Clientes com menos de 30 anos que residem em SP

### Utilização da aplicação:

A aplicação deve receber como entrada essas informações:

##### input

```json
{
  "customer": {
    "name": "Erikaya",
    "cpf": "123.456.789-10",
    "age": 29,
    "location": "BH",
    "income": 3000
  }
}
```

_Para fins de simplicidade, considere que vamos sempre receber os dados corretos (tipos e formatos)_

E deve responder essas informações:

##### output

```json
{
  "customer": "Erikaya",
  "loans": [
    {
      "type": "personal",
      "taxes": 1
    }
  ]
}
```

### Observações:

- O escopo desse desafio será desenvolvido junto com tripulantes na entrevista de pairing
- Precisamos que você traga para a entrevista um setup inicial da proposta de solução na linguagem que você preferir
- Esse teste deve ser mantido em anonimato

# Setup

- Instale as dependências

# Rode os testes

Você pode executar o comando a seguir pelo CLI:

```bash
$ ./gradlew test
```

Se o teste estiver falhando, então você teve sucesso. Nada tema!

Agora é só codar.

Boa sorte!

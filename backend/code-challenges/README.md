# Code Challenge

The assessment proposal which we'll develop together is provide a person with the loan types suitable for her, given some variables:

We must provide the following loan types:
Personal Loan. Interest Rate: 4%
Collateralized Loan. Interest Rate: 3%
Payroll Loan. Interest Rate: 2%

Listed below are the business rules for conceding a loan based on the person's profile:

|                          | Personal Loan | Collateralized Loan | Payroll |
| ------------------------ | ------------- | :-----------------: | ------- |
| Income <= 3000           | Yes           |       Yes\*\*\*     | No      |
| Income > 3000 & < 5000   | Yes           |        Yes\*\*      | No      |
| Income => 5000           | Yes           |         Yes\*       | Yes     |

- \* Clients under 30 y.o.
- \*\* Clients residing in SP (São Paulo state code in Brazil)
- \*\*\* Clients under 30 y.o. residing in SP

### App usage:

The application must receive the following data as input:

##### input

```json
{
  "customer": {
    "name": "Erikaya",
    "cpf": "123.456.789-10",
    "age": 29,
    "location": "SP",
    "income": 3000
  }
}
```

_For the sake of simplicity, consider we'll always receive the correct data (types and formats)_

And must respond the following data:

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

### Comments:

- The challenge scope will be developed alongside crew members during the pairing interview
- We need you to bring for the interview an initial setup of the solution proposal with the preferred language
- This assessment is confidential and must NOT be shared with other people than you and and our crew members

# Setup

- Install dependencies

# Rode os testes

You may execute the following command via CLI:

```bash
$ ./gradlew test
```

If tests are passing, everything is correctly set up, you're good to go!

Now it's all about coding.

Good luck!

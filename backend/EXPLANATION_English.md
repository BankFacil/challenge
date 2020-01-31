## Challenge for Backend Software Engineer

### Candidate:
Developer : Estela Medrano Jiménez

Linkedin : [go...](https://www.linkedin.com/in/estela-medrano-jim%C3%A9nez-52563776/)

GitHub: [go..](https://github.com/divae/challenge)

### Strategy:
- I have included a tests library to add the business rules, in order to help me with a development guided by tests.
- I have begun making a test to control the book example suggested.
- To do bussiness rules I have followed null object pattern.
- I have followed bussines rules in order. First of all I have done tests for all them. My priority wasn't refactoring in this time.
- When all the bussiness rules were made in TDD I focused in refactoring.
- Semantic level in the real code is good.

### Concerns

- The code could be more readable.
- The objects have their attributes too exposed.
- The Result class initializes Membership every time it is created, it should be activated only when necessary.
- I do not feel comfortable with the strategy where I have put the discount, I would give it another turn.
- Total_price variable is only used in tests. The invoice object should have knowledge of it.
- I use flags to know if actions are activated. I'm not sure if it is the best practice.

### Next steps:
- Ask if total_price and discount variable is included in the invoice.
- Extract classes to files.
- Refact Result Class:
  - Extract Shipping Object to delegate responsabilities.
  - Extract Notification Object to the same.
- Refact the Payment class, I would extract into an Object.
- Review the classes and adjust the accesses to the methods.
- Thanks for the oportunity :D .


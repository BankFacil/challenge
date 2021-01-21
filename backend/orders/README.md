# Order Application
This project was created to satisfy Creditas back-end challenge requirements.

Its purpose is to create a MVP of a Payment application. 

Since it is a prototype, it doesn't have all functionalities implemented. The purpose here is to show how the general flow
would work from order to cash.


### Tools

This project is developed using the following technologies:
- **Kotlin;**
- **JUnit4** for tests;

## Package Structure

```
Project
├── orders
│   ├── model: Data classes with related attributes
│   ├── service: Main service logic. Those classes will process the payment, send e-mail, and so on.
│          ├── paymentstrategy: Following the requirements, this directory contains all possible payment strategies. This will facilitate reusability and maintainability.
│   ├── client: This package contain code which will communicate with client, here services will be called       
```

# Requirements / Dependencies
- [Kotlin](https://kotlinlang.org/)
- [JUnit4](https://junit.org/junit4/) for unit tests;


## Tests

The project has some unit tests to cover some key scenarios. Please find at Test folder.

### Contributors

- Murilo M. Santos <murilommms@gmail.com>

---

## Support

* If you have any query or doubt, please, feel free to contact me by e-mail.




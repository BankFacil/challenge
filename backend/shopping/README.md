# Shopping

This software was designed to process online orders. 

It's written in Python 3 using the built-in library.

## Project Structure
* adr - Documentation related to the architecture decision
* tests - Automatized tests 
* src
  * command - Commands to perform a set of actions
  * factory - Factories for objects creation
  * model - Domain classes
  * service - Set of classes to handle with business logic
  
## Running

```bash
$ make install
$ make run 
```

## Running tests
```bash
$ make test
```

## Docker
```bash
$ make docker-run
```

## Architecture decision record (ADR)

An architectural decision record (ADR) is a document that captures an important architectural decision made along 
with its context and consequences.

Contents:

* [Data Class](adr/adr_data_class.md)
* [Strategy Pattern](adr/adr_strategy_pattern.md)
* [Command Pattern](adr/adr_command_pattern.md)
* [Factory Pattern](adr/adr_factory_pattern.md)

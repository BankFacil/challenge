# ADR - Data Classes

## Status

We're reviewing the design decisions of software that processes Online ordering.

## Context

Payments are made that receive treatments depending on the specific situations of each one as follows

## Decision

Reviewing the properties and relationships of the model classes was decided to use [Data Class](https://docs.python.org/3/library/dataclasses.html) 

## Consequences

Using data class, we have more control to create immutable and consistent objects. 
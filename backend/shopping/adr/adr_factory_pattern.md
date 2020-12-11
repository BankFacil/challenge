# ADR - Factory Pattern

## Status

We're reviewing the design decisions of software that processes Online ordering.

## Context

Payments are made that receive treatments depending on the specific situations of each one as follows

## Decision

The Factory Method pattern suggests that you replace direct object construction calls with calls to a special factory method.

## Consequences

The Factory Method separates the construction code from the code that actually uses it. Therefore it’s easier to extend the construction code independently from the rest of the code.
# ADR - Strategy Pattern

## Status

We're reviewing the design decisions of software that processes Online ordering.

## Context

Payments are made that receive treatments depending on the specific situations of each one as follows

## Decision

The command pattern capture the abstraction in an interface, bury implementation details in derived classes

## Consequences

A Strategy defines a set of algorithms that can be used interchangeably.
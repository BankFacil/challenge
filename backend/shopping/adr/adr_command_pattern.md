# ADR - Command Pattern

## Status

We're reviewing the design decisions of software that processes Online ordering.

## Context

Payments are made that receive treatments depending on the specific situations of each one as follows

## Decision

The command pattern encapsulates a request as an object, thereby letting us parametrize other objects with different requests, queue or log requests, and support undoable operations.

## Consequences

Each command is responsible for handle a specific action, in that way we can reuse a set o commands for similar business cases.
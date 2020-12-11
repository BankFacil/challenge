from attr import dataclass


@dataclass(frozen=True)
class Address:
    zipcode: str
    street: str
    city: str


@dataclass(frozen=True)
class Customer:
    nome: str
    address: Address


@dataclass(frozen=True)
class Invoice:
    billing_address: Address
    shipping_address: Address
    order: object


@dataclass(frozen=True)
class Membership:
    number: str
    customer: Customer

from enum import Enum
from subscription import Subscriptions


class ProductKind(Enum):
    physic = 'physic'
    digital = 'digital'
    book = 'book'
    subscription = 'subscription'

    @classmethod
    def is_physic(cls, product_type):
        return (product_type == cls.physic) or (product_type == cls.book)


class Product():
    def __init__(self, name: str, kind: ProductKind, price: int):
        if kind == ProductKind.subscription:
            try:
                Subscriptions().get(name)
            except KeyError:
                raise ValueError(
                    'Subscription does not exists! ' +
                    'Please, create it using "Subscriptions().create"'
                )

        self.name = name
        self.kind = kind
        self.price = price

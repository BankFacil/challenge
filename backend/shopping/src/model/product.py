from enum import Enum

from attr import dataclass


class ProductType(Enum):
    PHYSICAL = 'physical'
    BOOK = 'book'
    DIGITAL = 'digital'
    MEMBERSHIP = 'membership'


@dataclass(frozen=True)
class Product:
    name: str
    price: float
    product_type: ProductType

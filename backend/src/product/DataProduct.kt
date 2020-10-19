package product

import challenge.product.Execution
import challenge.product.ProductType

data class DataProduct(
    val name: String,
    val type: ProductType,
    val price: Double,
    var execution  : Execution?
)
package model

data class Pedido(
        val cliente: Cliente,
        val itens: List<Item>,
        val pagamento: Pagamento
)
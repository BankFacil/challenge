package model

data class Pagamento(val nroDocumento: String,
                     val forma: FormaPagamentoEnum,
                     val valor: Double,
                     val cartao: Cartao?,
                     val nroBoleto: String?)
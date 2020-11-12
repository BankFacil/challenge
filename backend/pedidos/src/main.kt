import model.*
import service.Ordem

class main {

    fun main(args : Array<String>){

        val cliente = Cliente("Eduarda Alves Santos Cardoso", "eduarda@teste.com", Endereco("Avenida Porto Alegre, 123", "Porto Alegre", "Rio Grande do Sul", "99999-999"))

        val itens = mutableListOf<Item>()
        itens.add(Item(Produto("Mouse sem fio", ProdutoEnum.FISICO, 30.00), 0, ""))
        itens.add(Item(Produto("Netflix", ProdutoEnum.ASSINATURA, 34.90), 0, ""))
        itens.add(Item(Produto("Senhor dos aneis", ProdutoEnum.LIVRO, 150.00), 0, ""))
        itens.add(Item(Produto("Joker", ProdutoEnum.MIDIADIGITAL, 59.90), 0, ""))

        val pedido = Pedido(cliente,itens,
                Pagamento("A1345C",
                        FormaPagamentoEnum.CREDITO,
                        274.80,
                        Cartao("1234567890", "11/23", "A222"),
                       ""))
        val ordem = Ordem(pedido)
        ordem.efetivarPedido()
    }
}
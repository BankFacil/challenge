package service

import model.*

class Ordem(val pedido: Pedido){

    private var itens = mutableListOf<Item>()
    private var textoEmail = "Olá, segue abaixo a descrição dos produtos adquiridos: "
    private var enviarEmail = false

    fun efetivarPedido(){
        for(item: Item in pedido.itens) {
            when {
                item.produto.tipo.equals(ProdutoEnum.MIDIADIGITAL) -> addMidia(item.produto)
                item.produto.tipo.equals(ProdutoEnum.FISICO) -> itens.add(Item(item.produto, 0, MensagemEnum.FISICO.msg))
                item.produto.tipo.equals(ProdutoEnum.ASSINATURA) -> ativarAssinatura(item.produto)
                item.produto.tipo.equals(ProdutoEnum.FISICO) -> itens.add(Item(item.produto, 0, MensagemEnum.LIVRO.msg))
                else -> itens.add(Item(item.produto, 0))
            }
        }

        if(enviarEmail)
            enviarEmail()
    }

    fun addMidia(produto: Produto){
        itens.add(Item(produto,10, ""))
        textoEmail(produto)
        enviarEmail = true
    }

    fun textoEmail(produto: Produto){
        textoEmail.plus("\n-").plus(produto.nome).plus(": ").plus(produto.preco)
    }

    fun ativarAssinatura(produto: Produto){
        pedido.cliente.assinatura = true
        textoEmail.plus("\nAssinatura ativada!")
        itens.add(Item(produto,0))
        enviarEmail = true
    }

    fun retornarCarrinho(): MutableList<Item> {
        return itens
    }

    fun enviarEmail(){
        print(textoEmail)
    }

}
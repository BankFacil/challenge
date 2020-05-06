# Solução
Para facilitar a implementação de novos produtos criei uma classe chamada `Products` de onde todos os outros produtos poderão ser derivados. Dentro dela existe o método `prepare_delivery` que é chamado após o pagamento do produto ser verificado.
Se o produto precisa de algum tratamento específico, anterior ao processo de entrega, após criar uma classe derivada de `Products` basta adicionar a rotina dentro do método `prepare_delivery`. Isso resolver o problema de ter que modificar código já pronto para adicionar novos produtos ou funcionalidades relacionadas.

A criação das etiquetas é feita a usando o método `ShipphingLabel.create_from(payment)`, é um método estático que gera uma etiqueta para cada item do pedido que foi pago.

# Observações
Para gerar a etiqueta de envio eu precisei optar por gerar uma etiqueta para cada item comprado, independente se no pedido tenha mais de um item ou não. Fiz isso pois cada item pode ter um comportamento diferente, como por exemplo o livro que é isento de taxas, se adicionar um outro produto junto a ele no pedido então os dois seriam isentos? Dessa maneira conflitos desse tipo são evitados.
Para realizar esse desafio, optei em utilizar a linguagem Python, pois dentre as três disponível, Python é a que mais tenho experiência, e também por ser uma opção adequada considerando os requisitos do desafio.

Usei como base o que já tinhamos no `bootstrap.py`, me inspirando nele para desenvolver a nova versão, mas sem copiar exatamente o que tinha, me focando em cumprir os requisitos do projeto e também em manter tudo simples.

# Organização geral

Em vista que o desafio exige que desenvolva-se guiando-se pela orientação a objetos, decidi separar as funcionalidades do projeto em diferentes classes. Após analisar e desenvolver pequenas POCs, cheguei a conclusão que, para cumprir os requisitos do desafio, o ideal seria haver as seguintes classes com as as seguintes finalidades:

- `ProductKind`: enum com os tipos de produtos disponíveis (no caso, `physic`, `digital`, `book` e `subscription`), e funções relacionados a lidar somente com isso
- `Product`: representar um produto, e todo produto precisa ter um nome, tipo e preço
- `Customer`: representar um cliente, tendo um nome e uma carteira. Além disso, pode-se enviar um e-mail ao cliente
- `Order`: representa um pedido, que nada mais é do que a relação entre vários produtos e um cliente. A partir de um pedido, pode-se gerar os `shipping_label` e pagá-lo
- `ShippingLabel`: representa as descrições de entrega de um produto
- `Subscriptions`: singleton para gerenciar os `Subscription`
- `Subscription`: representa uma assinatura, da qual pode ter clientes que a assinaram

Não foi necessário utilizar herança ([o que é bom!](https://codeburst.io/inheritance-is-evil-stop-using-it-6c4f1caf5117)). Uma classe apenas usa uma outra classe. O diagrama abaixo representa o que cada classe utiliza (a seta aponta de quem usa para o que usa):

![](/backend-solution/doc/diagram.png)

# Como usar

Em vista que o desafio não exige uma aplicação realmente funcional, pode-se utilizar apenas por meio dos testes. Para isso, execute na raiz do projeto:

```
nose2
```

Também pode rodar o linter:

```
flake8
```

Caso não tenha alguma dessas dependência, pode instalar usando:

```
pip3 install -r requirements.txt
```

# Fluxo da aplicação

Primeiramente, precisamos ter um produto. Para isso, podemos fazer:

```python
product = Product(
    name='something',
    kind=ProductKind.physic,
    price=100
)
```

Se o produto for uma subscription, antes precisamos criar essa subscription, caso contrario, uma exceção será levantada:

```python
Subscriptions().create('subscription_product')

product = Product(
    name='subscription_product',
    kind=ProductKind.subscription,
    price=100
)
```

Agora, precisamos criar um cliente:

```python
customer = Customer(
    name='macabeus',
    wallet=5000
)
```

Então, o pedido:

```python
order = Order(
    products=[product],
    customer=customer
)
```

Com esse pedido, podemos pagá-lo:

```python
order.pay()
```

Com isso, o dinheiro do customer foi debitado:

```python
customer.wallet # 4900
```

Se ele tiver comprado uma assinatura ou algum produto digital, ele terá recebido algumas mensagens no e-mail:

```python
customer.email_messages[0] # se tiver comprado um produto digital: 'discount voucher R$ 10'
customer.email_messages[0] # se tiver comprado uma assinatura: 'active subscription subscription_product'
```

Além de pagar, podemos gerar os `shipping_label`:

```python
order.generate_shipping_labels()
```

Uma shipping label armazena o produto, se ele deve ser colocado na caixa de envio (`should_be_put_on_shipping_box`) e se é insento de taxas (`has_tax_exemption`).

Para visualizar os clientes que assinaturam uma determinada assinatura:

```python
Subscriptions().get('subscription_product').customers_active
```

# Ademais

## Singleton no Subscriptions

Para a parte das assinaturas, optei em criar uma singleton, `Subscriptions`, para a partir dela poder criar e gerenciar as assinaturas. Okay, [sei que singletons apresentam vários problemas](https://stackoverflow.com/questions/137975/what-is-so-bad-about-singletons), boa parte por guardarem um estado global. Porém, quando essa aplicação for evoluir, usariamos um banco de dados para guardar as subscriptions - e assim teríamos de volta o estado global!

Desse modo, optei em usar uma singleton no `Subscriptions`, pois representaria melhor como a aplicação evoluiria.

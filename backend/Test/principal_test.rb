require 'test/unit'
require_relative '../lib/customer'
require_relative '../lib/order'
require_relative '../lib/product'
require_relative '../lib/shipping_label'
require_relative '../lib/payment'
require_relative '../lib/credit_card'

class PrincipalTest < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_deve_gerar_label_normal_quando_for_item_fisico
    customer = Customer.new(name:'Creditas' )
    product = Product.new(name:'Camisa', type: :physical)
    order = Order.new(customer)
    order.add_product(product)
    payment = Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))

    payment.pay
    expected = 'Customer Name: Creditas'
    actual = payment.shippingLabel.print

    assert_equal(expected,actual)
  end

  def test_deve_gerar_label_isento_quando_for_livro
    customer = Customer.new(name:'Creditas')
    product = Product.new(name:'Ruby', type: :book)
    order = Order.new(customer)
    order.add_product(product)
    payment = Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))

    payment.pay
    expected = 'Customer Name: Creditas OBS : isento de imposto'
    actual = payment.shippingLabel.print

    assert_equal(expected,actual)
  end

  def test_nao_deve_gerar_shipping_label_para_produto_tipo_assinatura
    customer = Customer.new(name:'Creditas')
    product = Product.new(name:'Ruby', type: :membership)
    order = Order.new(customer)
    order.add_product(product)

    payment = Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))
    payment.pay

    expected = ''
    actual = payment.shippingLabel.print

    assert_equal(expected,actual)
  end


  def test_quando_pagamento_for_assinatura_servico_deve_ativar_assinatura
    customer = Customer.new(name:'Creditas',username:'creditas', email:'creditas@creditas.com', password:'99999')
    product = Product.new(name:'Netflix', type: :membership)
    order = Order.new(customer)
    order.add_product(product)
    payment = Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))

    payment.pay
    expected = 'ativo'
    actual = payment.membership.status

    assert_equal(expected,actual)
  end

  def test_quando_pagamento_for_assinatura_servico_deve_notificar_usuario_via_email
    customer = Customer.new(name:'Creditas',username:'creditas', email:'creditas@creditas.com', password:'99999')
    product = Product.new(name:'Netflix', type: :membership)
    order = Order.new(customer)
    order.add_product(product)
    payment = Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))

    payment.pay
    expected = 'Ola Creditas, assinatura ativa. email : creditas@creditas.com, username:creditas'
    actual = payment.membership.email_message

    assert_equal(expected,actual)
  end

  def test_quando_pagamento_for_midia_digital_deve_enviar_descricao_da_compra_por_email
    customer = Customer.new(name:'Creditas',username:'creditas', email:'creditas@creditas.com', password:'99999')
    product = Product.new(name:'Matrix', type: :digital)
    order = Order.new(customer)
    order.add_product(product)
    payment = Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))

    payment.pay
    assert_true(payment.invoice.email_message == 'Detalhes da compra')
  end

  def test_quando_pagamento_for_midia_nao_for_digital_nao_deve_enviar_descricao_da_compra_por_email
    customer = Customer.new(name:'Creditas',username:'creditas', email:'creditas@creditas.com', password:'99999')
    product = Product.new(name:'Ruby', type: :book)
    order = Order.new(customer)
    order.add_product(product)
    payment = Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))

    payment.pay
    assert_true(payment.invoice.email_message.nil?)
  end

  def test_quando_pagamento_for_midia_digital_deve_criar_voucher_de_deconto_de_dez_reais
    customer = Customer.new(name:'Creditas',username:'creditas', email:'creditas@creditas.com', password:'99999')
    product = Product.new(name:'Matrix', type: :digital)
    order = Order.new(customer)
    order.add_product(product)
    payment = Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))

    payment.pay
    assert_true(payment.voucher.valor == 'R$ 10,00')
  end
end
describe OrderItem do

  context 'OrderItem' do

    product = Product.new('BDD', 'book')
    customer = Customer.new('foolano', 'email')
    order = Order.new(customer)

    context 'valid instance of OrderItem' do
      subject { OrderItem.new(order, product) }
      it 'should return an order_item object' do
        expect(subject).to be_an_instance_of(OrderItem)
      end
    end
  end
end

class ShippingLabel
  attr_reader :order

  def initialize(order:)
    @order= order
  end

  def get_type_tax
    (@order.items.any? {|item| item.product.type == :book}) ? 'isento' : 'normal'
  end

  def has_label
    (@order.get_type == :book || @order.get_type == :physical) ? true : false
  end

  def print
    if (has_label() == true)
      text = 'Customer Name: ' + @order.customer.name

      if (get_type_tax == 'isento')
        text += ' OBS : isento de imposto'
      end

      text
    else
      ''
    end

  end
end
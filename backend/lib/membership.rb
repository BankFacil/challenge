class Membership
  attr_reader :status,:order,:email_message

  def initialize(order:)
    @order = order
    if(order.get_type == :membership)
      create()
    end

  end

  def create
    @status='ativo'
    @email_message = 'Ola ' +  @order.customer.name + ', assinatura ativa. email : ' + @order.customer.email + ', username:' + @order.customer.username
  end
end
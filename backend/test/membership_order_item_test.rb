require_relative '../lib/bootstrap.rb'

module OnlineInvoice
  class MembershipItemTest < Minitest::Test
    attr_reader :customer, :membership_product, :order, :membership_repository, :mailer, :membership_item
    
    def setup
      @customer = Customer.new('king_size@bol.com.br')
      @membership_product = Product.new('Clean Coders', 'membership')
      @order = Order.new(@customer)
      
      @membership_repository = MiniTest::Mock.new
      @mailer = MiniTest::Mock.new
      @membership_item = MembershipOrderItem.new(@order, @membership_product, membership_repository, mailer)
    end

    def test_should_activate_membership_when_purchase_membership 
      @membership_repository.expect(:activate, true, [@membership_item])
      @mailer.expect(:send_mail, true, [String, String])

      @membership_item.close
    end

    def test_should_send_email_when_purchase_membership
      @membership_repository.expect(:activate, true, [MembershipOrderItem])
      @mailer.expect(:send_mail, true, ['king_size@bol.com.br', "Você acabou de assinar Clean Coders"])

      @membership_item.close
    end
  end
end

require_relative "./voucher"
require_relative "./customer_membership"

class Customer
  attr_reader :mail, :memberships, :vouchers

  def initialize(mail)
    @mail = mail
    @memberships = []
    @vouchers = []
  end

  def give_a_voucher_of(value)
    @vouchers << Voucher.new(value)
  end

  def add_a_membership(membership)
    customer_membership = CustomerMembership.new(self, membership)
    customer_membership.active
    @memberships << customer_membership
  end
end
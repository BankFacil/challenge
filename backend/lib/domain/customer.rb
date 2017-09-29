module OnlineInvoice
  class Customer
    attr_reader :email

    def initialize(email)
      @email = email
    end
  end
end

module Products
  class Product
    attr_reader :name
    attr_reader :tax_exempt

    def initialize(name)
      @name = name
      @tax_exempt = false
    end

    def tax_exempt?
      @tax_exempt
    end

    def prepare_delivery
      raise NotImplementedError.new
    end

    def send_details
      MailService.send_details(self)
    end
  end
end
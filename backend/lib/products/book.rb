module Products
  class Book < Product
    def prepare_delivery
      @tax_exempt = true
    end
  end
end
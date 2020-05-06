module Products
  class Physical < Product
    def prepare_delivery
      @shipping_carton = true
    end
  end
end
class Product
    attr_reader :name, :type
  
    def initialize(name, type)
      @name, @type = name, type
    end
end
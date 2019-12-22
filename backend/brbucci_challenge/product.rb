class Product
  
  attr_reader :name, :type

  def initialize(name, type)
    allowed_types = %w(book digital physical membership)
    @name, @type = name, type if allowed_types.any? {|e| e.include?(type) }
  end
end

class Customer

  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_customer
  end

  def purchase(product)
  	if product.in_stock?
  		Transaction.new(self, product)
  	else
  		raise OutOfStockError "#{product.title} is out of stock."
  	end
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.select { |c| c.name == name }.fetch(0)
  end

  def ==(another)
  	@name == another.name

  end


  private

  def add_customer
    if @@customers.include?(self)
      raise DuplicateCustomerError, "#{@name} already exists."
    else
      @@customers << self
    end
  end
  
end

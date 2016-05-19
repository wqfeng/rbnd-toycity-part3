class Transaction
  attr_reader :product, :customer, :buy, :id

  @@transactions = []

  def initialize(customer, product, buy=true)
    @customer = customer
    @product = product
    @id = @@transactions.length + 1
    @buy = buy
    add_transaction
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions[id - 1]
  end

  def self.find_by_customer(name)
    @@transactions.select { |e|  e.customer.name == name}
  end

  private

  def add_transaction
    @@transactions << self
    if @buy
      if @product.in_stock?
      	@product.sold
      else
        raise OutOfStockError, "#{product.title} is out of stock."
      end
    else
      @product.return
    end
  end

end

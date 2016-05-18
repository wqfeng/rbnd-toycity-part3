class Product

  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def in_stock?
  	@stock > 0
  end

  def sold
  	@stock = @stock - 1
  end

  def return
  	@stock += 1
  end
 
  def self.all
    @@products
  end

  def self.find_by_title(title)
  	@@products.select { |p| p.title == title }.fetch(0)
  end

  def self.in_stock
  	@@products.select {|p| p.in_stock?}
  end

  def ==(another)
  	@title == another.title
  end

  private

  def add_to_products
    if @@products.include?(self)
      raise DuplicateProductError, "#{title} already exists."
    else
      @@products << self
    end
  end

end

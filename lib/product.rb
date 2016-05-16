class Product

  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end


  private

  def add_to_products
    if duplicate?
      raise DuplicateProductError, "#{title} already exists."
    else
      @@products << self
    end
  end

  def duplicate?
  	@@products.map { |p| p.title  }.include?(title)
  end
end

class Customer

  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_customer
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.select { |c| c.name == name }.fetch(0)
  end


  private

  def add_customer
    if duplicate?
      raise DuplicateCustomerError, "#{name} already exists."
    else
      @@customers << self
    end
  end

  def duplicate?
    @@customers.map { |c| c.name  }.include?(name)
  end
end

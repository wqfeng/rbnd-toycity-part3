class Transaction
	attr_reader :product, :customer, :id

	@@transactions = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = @@transactions.length + 1
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
	end
end
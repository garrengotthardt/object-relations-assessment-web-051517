

class Customer
  attr_accessor :first_name, :last_name

  @@all_customers = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all_customers << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all_customers
  end

  def self.find_by_name(name)
    first_name = name.split(" ")[0]
    last_name = name.split(" ")[1]
    Customer.all.select do |customer|
      customer.first_name == first_name && customer.last_name == last_name
    end
  end

  def self.find_all_by_first_name(name)
    customer_first_match = []
    Customer.all.each do |customer|
       if customer.first_name == name
         customer_first_match << customer
      end
    end
    customer_first_match
  end

  def self.all_names
    customer_names = []
    Customer.all.each do |customer|
      customer_names << customer.full_name
    end
    customer_names
  end

  def add_review(restaurant, content)
    Review.new(restaurant, content, self)
  end

end

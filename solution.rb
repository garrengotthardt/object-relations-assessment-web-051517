

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




class Review

  attr_accessor :restaurant, :content, :customer

  @@all_reviews = []

  def initialize(restaurant, content, customer)
    @restaurant = restaurant
    @content = content
    @customer = customer
    @@all_reviews << self
  end

  def self.all
    @@all_reviews
  end

end




class Restaurant
  attr_accessor :name

  @@all_restaurants = []

  def initialize(name)
    @name = name
    @@all_restaurants << self
  end

  def self.all
    @@all_restaurants
  end

  def self.find_by_name(name)
    Restaurant.all.select do |restaurant|
      restaurant.name == name
    end
  end

  def reviews
    restuarant_reviews = []
    Review.all.each do |review|
      if review.restaurant == self
        restaurant_reviews << review
    end
    restuarant_reviews
  end

  def customers
    rest_reviews_array = self.reviews
    rest_reviews_array.collect do |review|
      review.customer
    end
  end

end

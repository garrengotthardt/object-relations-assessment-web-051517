

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

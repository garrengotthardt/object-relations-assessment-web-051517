

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

class Restaurant
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def reviews
    Review.all.select do |review|
      review.restaurant == self
    end
  end

  def customers 
    self.reviews.map do |restaurant|
      restaurant.customer
    end.uniq
  end
  
  #helper method
  def find_all_ratings
    self.reviews.map do |review|
      review.rating
    end.reduce(:+)
  end
  
  def average_star_rating
    self.find_all_ratings / self.reviews.count
    #binding.pry
  end



end
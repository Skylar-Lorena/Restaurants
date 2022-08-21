require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


george = Customer.new("George", "Washington")
thomas = Customer.new("Thomas", "Jefferson")
george_p = Customer.new("George", "Pencil")

mcdonalds = Restaurant.new("McDonalds")
kfc = Restaurant.new("KFC")
cpk = Restaurant.new("CPK")

review1 = Review.new(george, mcdonalds, 3)
review2 = Review.new(thomas, kfc, 8)
review3 = Review.new(thomas, kfc, 2)

puts "Customer knows their given name?"
pp george.given_name == "George"
puts ""
puts "Customer knows their family name?"
pp george.family_name == "Washington"
puts "Customer knows their full name?"
pp george.full_name == "George Washington"
puts ""
puts "Knows all the customers?"
pp Customer.all == [george, thomas, george_p]
puts ""
puts "Restaurant knows it's name?"
pp kfc.name == "KFC"
puts "Knows the review for a restaurant?"
pp review1.rating == 3
puts ""
puts "Returns all the reviews?"
pp Review.all == [review1, review2, review3]
puts ""
puts "Review knows the customer for that review?"
pp review1.customer == george
puts ""
puts "Review knows the restaurant object for that review?"
pp review2.restaurant == kfc
puts ""
puts "Restaurant knows it's reviews?"
pp kfc.reviews == [review2, review3]
puts ""
puts "Restaurant knows it's customers?"
pp kfc.customers == [thomas]
puts ""
puts "Customer knows their restaurants?"
pp thomas.restaurants == [kfc]
puts ""
puts "Customer can create a new review?"
pp thomas.add_review(cpk, 2)
puts ""
puts "Customer knows how many reviews they've done?"
pp george.num_reviews == 1
puts ""
puts "Customer can find by name?"
pp Customer.find_by_name("George Washington") == george
puts ""
puts "Customer can find a given name?"
pp Customer.find_all_by_given_name("George") == [george, george_p]
puts ""
puts "adds the ratings"
pp kfc.find_all_ratings == 10
puts "Restaurant knows it's average star rating?"
pp kfc.average_star_rating == 5
puts ""
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
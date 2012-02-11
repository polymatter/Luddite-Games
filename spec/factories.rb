# Factories for use with Factory Girl where writing tests
# eg. in a spec say user = Factory(:user)

# Factory.define :user do |f|
#   f.sequence(:email) { |n| "foo#{n}@example.com" }
#   f.password "secret"
# end

Factory.define :product do |p|
  p.name = "Test Product of super-awesomeness"
  p.description = "This is a description **test markup emphasis** \n-test markup list item \n-interesting things\nand stuff"
  p.image = "test_product_img.png"
  p.size = :packet
  p.price = 2.99
end
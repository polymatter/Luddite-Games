# Factories for use with Factory Girl where writing tests
# eg. in a spec say user = Factory(:user)

Factory.define :product do |p|
  p.sequence(:name) { |n| "Test Product #{n}" }
  p.description   "This is a description **test markup emphasis** \n\n- test markup list item \n\n- interesting things\n\nand stuff"
  p.image         "test_product_img.png"
  p.sequence(:size)  { |n| (n < 3 ? :small : (n < 7 ? :medium : :large)) }
  p.sequence(:price) { |n| 2.99 + (n * 0.25) }
end
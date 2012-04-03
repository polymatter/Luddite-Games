# Factories for use with Factory Girl where writing tests
# eg. in a spec say user = Factory(:user)

FactoryGirl.define do

  factory :product do |p|
    p.sequence(:name) { |n| "Test Product #{n}" }
    p.description   "This is a description **test markup emphasis** \n\n- test markup list item \n\n- interesting things\n\nand stuff"
    p.image         "test_product_img.png"
    p.sequence(:size)  { |n| (n < 3 ? :small : (n < 7 ? :medium : :large)) }
    p.sequence(:price) { |n| 2.99 + (n * 0.25) }
  end

  factory :cartitem do |i|
    association :cart
    association :product
	i.quantity 1
  end

  factory :cart do |c|
  
    factory :cart_with_items do
  
      ignore do
        quantity_of_each_product [1, 1, 2, 3]
		products FactoryGirl.create_list(:product, 4)
      end
  
      after_create do |cart, evaluator|
        evaluator.quantity_of_each_product.each_with_index do |quantity, product_index|
		  product = evaluator.products[product_index]
	      FactoryGirl.create(:cartitem, :quantity => quantity, :product => product, :cart => cart)
	    end
      end
    end  
  end
end
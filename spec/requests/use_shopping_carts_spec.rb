require 'spec_helper'

describe "use a shopping cart" do
  before(:each) do
    @products = FactoryGirl.create_list(:product, 4)
    product_count = [1, 1, 3, 1]
	@cart = FactoryGirl.create(:cart_with_items, products: @products, product_count: product_count)
  end
  
  # tests do not seem to be able to open external pages (eg. paypal form)
  
  it "can add items to shopping cart" do
    visit root_url
	product = Product.find(1)
	find_button("add_#{product.id}").click
	@cart.products.include? product
  end
  
  it "can add items that are already in the cart to increase quantity" do
	cartitem = @cart.cartitems.first
	#cartitem.id.should == 12
	cartitem.should_not be_nil
	
	#remember how many items were originally
	original_quantity = cartitem.quantity.to_i
	original_quantity.should == 1
	
	#click on the 'add to cart' button twice
	visit root_url
	find_button("add_#{cartitem.product.id}").click
	visit root_url
	find_button("add_#{cartitem.product.id}").click
	cartitem.been_added.should == true
	#cartitem.add(2)
	
	#quantity of the item in the basket should have increased by 2
	cartitem.quantity.to_i.should == 2 + original_quantity
  end
  
end

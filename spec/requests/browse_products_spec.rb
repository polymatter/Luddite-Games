require 'spec_helper'

describe "browse products" do
  before(:each) do
    @products = FactoryGirl.create_list(:product, 1)
  end

  it "has a price list to all products we sell on the home page" do
    visit root_url
	@products.each do |product|
	  page.should have_content(product.name)
	  page.should have_content(product.price)
	end
  end
  
  it "displays the product page when you click on the product name" do
	@products.each do |product|
	  visit root_url
	  click_link(product.name)
	  current_path.should == product_path(product)
	end
  end
  
  it "renders markdown descriptions on all product pages" do
    @products.each do |product|
      visit product_path(product)
	  page.should have_selector('li', :text => "test")
	  page.should have_selector('strong', :text => "test")
    end
  end
end

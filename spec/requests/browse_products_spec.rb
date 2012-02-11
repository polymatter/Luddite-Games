require 'spec_helper'

describe "browse products" do
  # allows every test to have access to a default factory-produced product
  let(:product) { Factory(:product) }

  it "shows products that we are selling on the home page" do
    visit root_url
	page.should have_content(product.name)
	page.should have_content(product.price)
  end
  
  it "clicking on a product name, displays the page for that product" do
    visit root_url
	click_link(product.name)
	current_path.should == product_path(product)
  end
  
  it "renders markdown descriptions" do
    visit product_path(product)
	page.should have_selector('li', :text => "test")
	page.should have_selector('em', :text => "test")
  end
end

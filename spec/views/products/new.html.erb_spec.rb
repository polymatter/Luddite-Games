require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyText",
      :image => "MyString",
      :size => "MyString",
      :price => 1.5
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_image", :name => "product[image]"
      assert_select "input#product_size", :name => "product[size]"
      assert_select "input#product_price", :name => "product[price]"
    end
  end
end

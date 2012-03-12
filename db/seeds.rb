# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create({:name => "Test Product 1", :description => "This is a description **test markup emphasis** \n\n-test markup list item \n\n-interesting things\n\nand stuff", :image => "test_product_img.png", :size => :small, :price => 2.99})
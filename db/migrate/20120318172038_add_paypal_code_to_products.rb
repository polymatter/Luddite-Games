class AddPaypalCodeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :paypal_code, :text
  end
end

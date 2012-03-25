class RemovePaypalCodeFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :paypal_code
  end

  def down
    add_column :products, :paypal_code, :text
  end
end

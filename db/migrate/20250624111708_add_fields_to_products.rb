class AddFieldsToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :price, :decimal
    add_column :products, :stock, :integer
    add_column :products, :active, :boolean
  end
end

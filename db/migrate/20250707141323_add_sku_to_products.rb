class AddSkuToProducts < ActiveRecord::Migration[8.0]
  def up
    add_column :products, :sku, :string
  end

  def down
    remove_column :products, :sku
  end
end

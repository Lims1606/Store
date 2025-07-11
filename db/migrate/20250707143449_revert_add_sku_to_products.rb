require_relative "20250707141323_add_sku_to_products"

class RevertAddSkuToProducts < ActiveRecord::Migration[8.0]
  def change
    revert AddSkuToProducts
  end
end

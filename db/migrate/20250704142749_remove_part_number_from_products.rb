class RemovePartNumberFromProducts < ActiveRecord::Migration[8.0]
  def change
    remove_column :products, :part_number, :string
  end
end

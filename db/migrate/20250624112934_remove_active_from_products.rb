class RemoveActiveFromProducts < ActiveRecord::Migration[8.0]
  def change
    remove_column :products, :active, :string
    remove_column :products, :boolean, :string
  end
end

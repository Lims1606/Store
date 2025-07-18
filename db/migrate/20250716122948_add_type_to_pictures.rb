class AddTypeToPictures < ActiveRecord::Migration[8.0]
  def change
    add_column :pictures, :type, :string
  end
end

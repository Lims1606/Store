class AddDescriptionToProducts < ActiveRecord::Migration[8.0]
  def change
    reversible do |direction|
      change_table :products do |t|
        direction.up   { t.text :description }
        direction.down { t.remove :description }
      end
    end
  end
end

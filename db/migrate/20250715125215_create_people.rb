class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.boolean :special_user, default: false

      t.timestamps
    end
  end
end

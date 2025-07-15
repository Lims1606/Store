class DestroyAgeFromPerson < ActiveRecord::Migration[8.0]
  def change
    reversible do |dir|
        dir.up do
          remove_column :people, :age, :integer
        end

        dir.down do
          add_column :people, :age, :integer 
      end
    end
  end
end

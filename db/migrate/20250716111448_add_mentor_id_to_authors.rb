class AddMentorIdToAuthors < ActiveRecord::Migration[8.0]
  def change
    add_column :authors, :mentor_id, :integer
  end
end

class Author < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :books, dependent: :destroy, after_add: :log_addition
  has_many :pictures, as: :imageable
  belongs_to :mentor, class_name: "Author", optional: true
  has_many :mentees, class_name: "Author", foreign_key: "mentor_id"
  has_and_belongs_to_many :coauthored_books,
                          class_name: "Book",
                          join_table: "authors_books"

  private

  def log_addition(book)
    puts "Added Book: #{book.title} to Author: #{self.name}"
  end
end

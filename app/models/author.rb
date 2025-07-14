class Author < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :books, dependent: :destroy
  has_and_belongs_to_many :coauthored_books,
                          class_name: "Book",
                          join_table: "authors_books"
end

class Book < ApplicationRecord
  belongs_to :author
  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories
  has_and_belongs_to_many :coauthors,
                          class_name: "Author",
                          join_table: "authors_books"
end

class Article < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :title, presence: true, length: { maximum: 255 }
end

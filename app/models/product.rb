class Product < ApplicationRecord
  validates :name, presence: { strict: true }, length: { maximum: 50 }, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :partnumber, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Only letters and numbers allowed" }

  validates :user_id, presence: true
  validates :supplier_type, presence: true
  validates :supplier_id, presence: true

  validate :short_description

  def short_description
    if description.present? && description.length > 500
      errors.add(:description, "is too long. Please keep it under 500 characters")
    end
  end
end

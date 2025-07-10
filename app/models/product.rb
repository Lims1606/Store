class Product < ApplicationRecord
  validates :name, presence: { strict: true }, length: { maximum: 50 }, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :partnumber, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Only letters and numbers allowed" }

  validates :user_id, presence: true
  validates :supplier_type, presence: true
  validates :supplier_id, presence: true

  validate :short_description

  before_validation :strip_name
  after_save :log_expensive_product, if: -> { price.present? && price > 50 }

  def short_description
    if description.present? && description.length > 500
      errors.add :description, "is too long. Please keep it under 500 characters"
    end
  end

  private

  def strip_name
    self.name = name.strip if name.present?
  end

  def log_expensive_product
      puts "Expensive product saved: #{name} ($#{price})"
  end
end

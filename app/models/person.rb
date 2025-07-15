class Person < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validate :check_age

  after_save :saving, on: :update

  private

  def check_age
    if self.age < 18
      errors.add(:base, "You are not eligible to register")
    end
  end
end

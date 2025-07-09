class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :age, presence: true, length: { maximum: 2 }
  validates :email, presence: true, uniqueness: true
  validates_each :email do |record, attr, value|
    unless value.ends_with?(".com")
      record.errors.add(attr, "must end with .com")
    end
  end

  before_validation :capitalize_name
  after_create :log_new_user
  after_update :log_user_update

  private

  def capitalize_name
    self.name = name.capitalize if name.present?
  end

  def log_new_user
    puts "A new user was registered, name: #{name}, age: #{age}"
  end

  def log_user_update
    puts "User #{name} was updated at #{Time.current}"
  end
end

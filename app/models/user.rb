class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :age, presence: true, length: { maximum: 2 }
  after_create :log_new_user

  private

  def log_new_user
    puts "A new user was registered, name: #{name}, age: #{age}"
  end
end

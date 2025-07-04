class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  after_create :log_new_user

  private

  def log_new_user
    puts "A new user was registered"
  end
end

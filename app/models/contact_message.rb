class ContactMessage
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::AttributeMethods
  include ActiveModel::Callbacks

  attribute :name, :string
  attribute :email, :string
  attribute :body, :string

  validates :name, :email, :body, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end

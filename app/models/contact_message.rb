class ContactMessage
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::AttributeMethods
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations::Callbacks
  include ActiveModel::Callbacks
  include ActiveModel::Naming

  attribute_method_prefix "upcase_"
  define_attribute_methods :name, :email, :body

  attribute :name, :string
  attribute :email, :string
  attribute :body, :string

  validates :name, :email, :body, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  before_validation :strip_name

  private

  def strip_name
    self.name = name.strip if name
  end

  def upcase_attribute(attr)
    send(attr).to_s.upcase
  end
end

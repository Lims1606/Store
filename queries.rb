user = User.new(name: "Alice", age: 20)
user.save

user = User.create(name: "Alice", age: 20)

user = User.create!(name: "Alice", age: 20)

user = User.create(name: "Alice", age: 20)
user.valid?
user.errors.full_messages

users = User.all

user = User.find(1)

user = User.find_by(name: "Alice")

users = User.where(name: "Alice")

users = User.all
first_user = user.first
last_user = user.last

user = User.first
user.inspect

user = User.last
user.inspect

user = User.pluck(:name)

user = user.find(3)
user.update(name: "Sam", age: 40)

user = User.find(7)
user.name = "Ostrich"
user.save

user = User.where(name: "Alice").update_all(name: "Alicia")

user = User.find(8)
user.destroy

user = User.destroy_by(name: "Sam")

user = User.find(8)
user.delete

user = User.where(name: "Alice").destroy_all

user = User.where(name: "Alice").delete_all

p = Product.new(name: "Shirts", price: 50, partnumber: "124", user_id: 1, supplier_type: "Supplier", supplier_id: 11)
p.new_record?
p.persisted?
p.valid?
p.errors.full_messages

p = Product.new(name: "Pants", price: 50, partnumber: "124", user_id: 1, supplier_type: "Supplier", supplier_id: 11)
p.new_record?
p.persisted?
p.valid?
p.errors.size
p.errors[:name]
p.errors.full_messages

u = User.create(name: "simen", age: 20, email: "simen@gmail.com")
u.valid?
puts u.name
u = User.last
u.update(name: "updated name")

# .new and .save
user = User.new(name: "Alice", age: 20)
user.save

# .create
user = User.create(name: "Alice", age: 20)

# .create!
user = User.create!(name: "Alice", age: 20)

# error handling
user = User.create(name: "Alice", age: 20)
user.valid?
user.errors.full_messages

# .all
users = User.all

# .find
user = User.find(1)

# .find_by
user = User.find_by(name: "Alice")

# .where
users = User.where(name: "Alice")

# .first/ .last
users = User.all
first_user = user.first
last_user = user.last

user = User.first
user.inspect

user = User.last
user.inspect

# .pluck
user = User.pluck(:name)

# .update
user = user.find(3)
user.update(name: "Sam", age: 40)

# assigning and saving
user = User.find(7)
user.name = "Ostrich"
user.save

# .update_all
user = User.where(name: "Alice").update_all(name: "Alicia")

# .destroy
user = User.find(8)
user.destroy

# .destroy_by
user = User.destroy_by(name: "Sam")

# .delete
user = User.find(8)
user.delete

# .destroy_all
user = User.where(name: "Alice").destroy_all

# .delete_all
user = User.where(name: "Alice").delete_all

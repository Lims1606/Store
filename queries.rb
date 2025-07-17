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

p = Product.new(name: "bag", price: 300, partnumber: "128", user_id: 1, supplier_id: 1, supplier_type: "supplier")
p.save

author = Author.create!(name: "Alice")
book = author.books.create!(title: "Awesome Book")

puts book.author.name
puts author.books.map(&:title)

author = Author.first
author.books
author.book.map(&:title)

book = Book.first
book.title
book.author
book.author.name

Book.all.each do |book|
  puts "\"{#book.title}\" was written by #{book.author.name}"
end

author = Author.find_by(name: "Candace")
author.books.create!(title: "book for Candace")
author.books.map(&:title)

book = Book.new(title: "Wonderful")

author = book.build_author(name: "Daniel")
author.persisted?
book.author_id?
author.save

book.author_id = author.id
book.save

book = Book.first
category = Category.create!(name: "Adventure")

book.categories << category

puts book.categories.map(&:name)
puts category.books.map(&:title)

author = Author.first
profile = author.create_profile(bio: "Fantasy writer")

puts author.profile.bio

a1 = Author.create!(name: "Author One")
a2 = Author.create!(name: "Author Two")

book = a1.books.create!(title: "Collaboration")

book.coauthors << a1
book.coauthors << a2

puts book.coauthors.map(&:name)
puts a1.coauthored_books.map(&:title)

author = Author.first
author.pictures.create!(name: "Profile picture")

book = Book.first
book.pictures.create!(name: "Book cover")

author.pictures.map(&:name)
book.pictures.map(&:name)

pic = Picture.first
pic.imageable
pic.imageable.name

pic = Picture.last
pic.imageable
pic.imageable.title

senior = Author.create(name: "Senior Author")
junior = Author.create!(name: "Junior Author", mentor: senior)

junior.mentor.name
senior.mentess.map(&:name)

Author.where.not(mentor_id: nil)
Author.joins(:mentees).distinct

author = Author.last
pic = PortraitPicture.create!(name: "Author portrait", imageable: author)

pic.class
Picture.last.class

book = Book.first
pic = CoverPicture.create!(name: "Book cover", imageable: book)

pic.class
Picture.last.class

PortraitPicture.pluck(:name)
CoverPicture.pluck(:name)

cm = ContactMessage.new(name: "John", email: "john@gmail.com", body: "hello")
cm.valid?
cm.erorrs.full_messages
cm.attribute_names
cm.attributes
cm.name
cm.email
cm.body

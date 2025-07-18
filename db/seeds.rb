author1 = Author.create!(name: "Alice", bio: "Writes fiction")
author2 = Author.create!(name: "Bob", bio: "Writes non-fiction")
author3 = Author.create!(name: "Charlie", bio: "Writes science books")

author2.update!(mentor: author1)
author3.update!(mentor: author1)

book1 = Book.create!(title: "Solo Book", author: author1)
book2 = Book.create!(title: "Collab Book", author: author2)

author1.coauthored_books << book2
author3.coauthored_books << book2
fiction = Category.create!(name: "Fiction")
science = Category.create!(name: "Science")

BookCategory.create!(book: book1, category: fiction)
BookCategory.create!(book: book2, category: science)

Profile.create!(bio: "I am Alice's profile", author: author1)

Picture.create!(name: "cover1.jpg", imageable: book1)
PortraitPicture.create!(name: "portrait_pic.jpg", imageable: author1, type: "PortraitPicture")
CoverPicture.create!(name: "book_cover.jpg", imageable: book2, type: "CoverPicture")

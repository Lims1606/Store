10.times do |i|
  Person.create(name: "Bob#{i + 1}", age: (i+ 20), email: "bob#{i+1}@gmail.com")
end

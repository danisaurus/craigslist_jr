user = User.create!(full_name: "Danielle",
                    username: "danisaurus",
                    email: "danidirks@gmail.com",
                    password: "donuts" )

15.times do
  User.create(full_name: Faker::Name.first_name,
              username:   Faker::Internet.user_name,
              email:      Faker::Internet.email,
              password:   "1"
              )
end

5.times do
  Category.create(name: Faker::Lorem.words(2).join(" ").upcase,
                  description: Faker::Lorem.paragraph)
end

30.times do
  Classified.create(title: Faker::Company.name,
                    description: Faker::Lorem.paragraph(6),
                    condition:   Faker::Company.bs,
                    location:    Faker::Address.street_address,
                    zip_code:    Faker::Address.zip_code,
                    price:       Faker::Commerce.price,
                    user_id:     rand(1..16),
                    category_id: rand(1..5))
end

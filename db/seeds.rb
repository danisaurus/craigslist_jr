user = User.create!(first_name: "Danielle",
                    last_name: "Dirks",
                    username: "danisaurus",
                    email: "danidirks@gmail.com",
                    password: "donuts" )

15.times do
  User.create(first_name: Faker::Name.first_name,
              last_name:  Faker::Name.last_name,
              username:   Faker::Internet.user_name,
              email:      Faker::Internet.email,
              password:   "1"
              )
end

15.times do
  Category.create(name: Faker::Lorem.words(2).join(" ").upcase,
                  description: Faker::Lorem.paragraph)
end

15.times do
  Classified.create(title: Faker::Company.name,
                    description: Faker::Lorem.paragraph(2),
                    condition:   Faker::Company.bs,
                    location:    Faker::Address.street_address,
                    zip_code:    Faker::Address.zip_code,
                    price:       Faker::Commerce.price,
                    user_id:     User.all.sample.id,
                    category_id: Category.all.sample.id)
end

user = User.create!( username: "danisaurus",
                        email: "danidirks@gmail.com",
                     password: "donuts" )

15.times do
  User.create(username:  Faker::Internet.user_name,
                  email:  Faker::Internet.email,
               password:  "1")
end

5.times do
  Category.create( name: Faker::Lorem.words(2).join(" ").upcase,
            description: Faker::Lorem.paragraph)
end

30.times do
  Classified.create(title: Faker::Company.name,
              description: Faker::Lorem.paragraph(6),
                condition: Faker::Company.bs,
                 location: Faker::Address.street_address,
                 zip_code: Faker::Address.zip_code,
                    price: Faker::Commerce.price,
                  user_id: rand(1..16),
              category_id: rand(1..5))
end


20.times do
  Post.create( title: Faker::Lorem.paragraph(1),
                text: Faker::Lorem.paragraph(10),
             user_id: rand(1..16),
             upvotes: rand(1..100),
           downvotes: rand(1..100))
end

30.times do
  Comment.create( text: Faker::Lorem.paragraph(5),
               user_id: rand(1..16),
               post_id: rand(1..20),
               upvotes: rand(1..100),
             downvotes: rand(1..100))
end

30.times do
  Comment.create( text: Faker::Lorem.paragraph(5),
               user_id: rand(1..16),
     parent_comment_id: rand(1..30),
               upvotes: rand(1..100),
             downvotes: rand(1..100))

end

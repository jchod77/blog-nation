require 'faker'

10.times do
  User.create(name: Faker::Name.name, username: Faker::Name.name, email: Faker::Internet.email, password: "password", password_confirmation: "password")
end

100.times do
  Post.create(title: Faker::Lorem.sentence(1), content: Faker::Lorem.paragraph(5), photo_url: Faker::Internet.url, user_id: (1..10).to_a.sample)
end

500.times do
  Comment.create(content: Faker::Lorem.sentence(25), user_id: (1..10).to_a.sample, post_id: (1..100).to_a.sample)
end

50.times do
  Tag.create(name: Faker::Lorem.word)
end

30.times do
  PostTag.create(post_id: (1..100).to_a.sample, tag_id: (1..50).to_a.sample)
end

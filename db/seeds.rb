user_1 = User.create(email: "testmail@mail.com", password: "asdfasdf", password_confirmation: "asdfasdf", firstname: "john", lastname: "snow")
# user_2 = User.create(email: "madmax@email.com", password: "sexo", password_confirmation: "asdfasdf", firstname: "Midas", lastname: "")
# user_3

puts "1 user created.."
100.times do |post|
  Post.create(date: Date.today, rationale: "rationale content #{post}", user_id: user_1.id )
end

puts "100 posts have been created"


user_1 = User.create(email: "testmail@mail.com", password: "asdfasdf", password_confirmation: "asdfasdf", firstname: "john", lastname: "snow")
user_2 = AdminUser.create(email: "adminuser@mail.com", password: "adminuser", password_confirmation: "adminuser", firstname: "Midas", lastname: "Strogstromm")

user_3 = User.create(email: "activeguy@mail.com", password: "asdfasdf", password_confirmation: "asdfasdf", firstname: "Steph", lastname: "Curry")

puts "#{User.count} user(s) created.."
100.times do |post|
  Post.create(date: Date.today, rationale: "rationale content #{post}", user_id: user_1.id )
end

10.times do |post|
  Post.create(date: Date.today, rationale: "Soundboy ruffneck all massive #{post}", user_id: user_3.id )
end


puts "100 posts have been created"


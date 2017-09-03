FactoryGirl.define do

  sequence :email do |n|
    "test#{n}@email.com"
  end

  factory :user do
    firstname 'john'
    lastname 'snow'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :non_authorized_user, class: User do
    firstname 'Bom'
    lastname 'Mark'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :admin_user, class: AdminUser do
    firstname 'Admin'
    lastname 'Adminuser'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end
end


# @user = User.create(email: "testmail@mail.com", password: "asdfasdf", password_confirmation: "asdfasdf", firstname: "john", lastname: "snow")
#     @post = Post.create(rationale: "i dids it", date: Date.today, user_id: @user.id)

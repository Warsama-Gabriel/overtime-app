FactoryGirl.define do

  factory :post do
    date Date.today
    rationale "some rationale"
    #set user association
    user
  end

  factory :second_post, class: Post do
    date Date.yesterday
    rationale "Some content"
    user
  end

end

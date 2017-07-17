require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(email: "testmail@mail.com", password: "asdfasdf", password_confirmation: "asdfasdf", firstname: "john", lastname: "snow")
    @post = Post.create(rationale: "i dids it", date: Date.today, user_id: @user.id)
  end

  describe "Creation" do
    it "can be created" do
      expect(@post).to be_valid
    end

    it "can't be created without a rationale or date" do
      @post.rationale = nil
      @post.date = nil
      expect(@post).to_not be_valid
    end
  end
end

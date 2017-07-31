require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
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

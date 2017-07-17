require 'rails_helper'

RSpec.describe User, type: :model do
  #wrap in block to descibe the type of test
  before do
    @user = User.create(email: "testmail@mail.com", password: "asdfasdf", password_confirmation: "asdfasdf", firstname: "john", lastname: "snow")
  end
  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end

    it "can not be created without firstname, lastname" do
      @user.firstname = nil
      @user.lastname = nil
      expect(@user).to_not be_valid
    end
  end
end

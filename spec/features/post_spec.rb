require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "testmail@mail.com", password: "asdfasdf", password_confirmation: "asdfasdf", firstname: "john", lastname: "snow")
    login_as(@user, scope: :user )
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be visited successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of posts' do
      expect(page).to have_content('Posts')
    end

    it 'has a list of posts' do
      post1 = Post.create(rationale: "Post1", date: Date.today, user_id: @user.id)
      post2 = Post.create(rationale: "Post2", date: Date.today, user_id: @user.id)
      visit posts_path
      #ordering of visit method matters
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    # user vists and can fill out the form to post
    # the post is associated with the user
    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'allows users to create a new post from the /new page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on 'Save'

      expect(page).to have_content('Some rationale')
    end

    it 'has a user associated with the post' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User association'

      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User association')
    end
  end
end

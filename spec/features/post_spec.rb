require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be visited successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of posts' do
      visit posts_path
      expect(page).to have_content('Posts')
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "testmail@mail.com", password: "asdfasdf", password_confirmation: "asdfasdf", firstname: "john", lastname: "snow")
      login_as(user, scope: :user )
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

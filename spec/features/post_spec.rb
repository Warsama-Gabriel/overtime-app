require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
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
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
      #ordering of visit method matters
      expect(page).to have_content(/rationale|content/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path
      #id of the link
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
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

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end
    it 'can be reached by clicking edit on index page' do
      visit posts_path
      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[rationale]', with: "Issa editable."

      click_on 'Save'

      expect(page).to have_content('Issa editable.')
    end
  end

  describe 'delete' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'can be deleted' do
      visit posts_path
      click_link("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end
end

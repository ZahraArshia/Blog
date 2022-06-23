require 'rails_helper'

RSpec.describe 'users show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.', email: 'tom@gmail.com', password: '123456')
    @second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Poland.', email: 'lilly@gmail.com', password: '123456')
    @first_user.save!
    @second_user.save!

    10.times do |num|
      @post = Post.create(author: @first_user, title: "Post #{num}", text: "This is my #{num} post")
    end

    visit root_path
    fill_in 'Email', with: 'tom@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    visit user_path(@first_user.id)
  end

  after(:each) do
    User.destroy_all
  end

  describe 'user show page' do
    it "Shows the user's photo" do
      expect(page).to have_css('.user-image')
    end

    it 'Shows the username' do
      expect(page).to have_content('Tom')
    end

    it 'show number of posts per user' do
      expect(page).to have_content(@first_user.posts_counter)
      expect(page).to have_content 'Number of posts: 10'
    end

    it "show user's bio." do
      expect(page).to have_content('Bio:')
      expect(page).to have_content('Teacher from Mexico.')
    end

    it 'show users first 3 posts.' do
      expect(page).to have_content 'This is my 9 post'
      expect(page).to have_content 'This is my 8 post'
      expect(page).to have_content 'This is my 7 post'
    end

    it "show button that lets me view all of a user's posts." do
      expect(page).to have_link('See all posts')
    end

    it "click post and redirect to that post's show page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@first_user)

      visit user_post_path(@first_user.id, @post.id)
      expect(page).to have_content 'Like'
    end

    it "click see all posts and redirects to user's post's index page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@first_user)

      visit user_posts_path(@first_user.id)

      10.times do |i|
        expect(page).to have_content "This is my #{i} post"
      end
    end
  end
end

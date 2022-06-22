require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email: 'tom@gmail.com', password: '123456')

    @post1 = Post.create(author: @first_user, title: "Hello", text: "This is my first post")
    @post2 = Post.create(author: @first_user, title: "Hello", text: "This is my second post")
    @post3 = Post.create(author: @first_user, title: "Hello", text: "This is my 3rd post")
    @post3 = Post.create(author: @first_user, title: "Hello", text: "This is my 4th post")
    @post4 = Post.create(author: @first_user, title: "Hello", text: "This is my 5th post")

    5.times do |num|
      @comment = Comment.create(post: @post1, author: @first_user, text: "comment#{num}")
    end
    
    Like.create(author: @first_user, post: @post1)

    visit new_user_session_path
    fill_in 'Email', with: 'tom@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    visit user_posts_path(@first_user.id)
  end

  describe 'post index page' do
    
    it "Shows the user's photo" do
      expect(page).to have_css(".user-image")
    end

    it 'Shows the username' do
      expect(page).to have_content @first_user.name
      expect(page).to have_content('Tom')
    end

    it 'shows number of posts of user has written' do
      post = Post.all
      expect(post.size).to eql(5)

      expect(page).to have_content(@first_user.posts_counter)
    end

    it 'shows post title' do
      expect(page).to have_content 'Hello'
    end

    it "should show the post's body." do
      expect(page).to have_content 'This is my first post'
    end

    it 'should show the first comments on a post' do
      expect(page).to have_content 'comment1'
    end

    it 'should display the number of comments the user has written' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'should display how many likes a post has.' do
      visit user_post_path(@first_user.id, @post1.id)
      expect(page).to have_content 'Like'
      expect(page).to have_content(@post1.likes_counter)
    end

    it 'show a section for pagination if there are more posts than fit on the view.' do
      visit user_path(@first_user.id)
      expect(page).to have_link('See all posts')
    end

    it "redirects the user to the post's show page after clickin on it" do
      visit user_post_path(@first_user.id, @post1.id)
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
  end
end
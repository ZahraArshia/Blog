require 'rails_helper'

RSpec.describe 'users index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email: 'tom@gmail.com', password: '123456')
    @second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', email: 'lilly@gmail.com', password: '123456')
    @first_user.save!
    @second_user.save!
    
    visit root_path
    fill_in 'Email', with: 'tom@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  after(:each) do
    User.destroy_all
  end

  describe 'User index page' do
    it 'Shows the username' do
      expect(page).to have_content('Tom')
    end

    it "Shows the user's photo" do
      expect(page).to have_css(".user-image")
    end

    it 'Shows the number of posts' do
      all(:css, '.number_posts').each do |post|
        expect(post).to have_content('Number of posts:')
      end
    end

    it "after clicking on the user, it will be redirected to that user's show page" do
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content 'Tom'
      expect(page).to have_no_content('See All Posts')
    end
  end
end
require 'rails_helper'

RSpec.feature 'login page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        email: 'tom@gmail.com', password: '123456')
  end

  background { visit new_user_session_path }
  scenario 'displays form fields' do
    expect(page).to have_field('user_email')
    expect(page).to have_field('user_password')
    expect(page).to have_button('Log in')
  end

  describe 'Login info' do
    it 'should not login with blank credentials' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'should not login with invalid credentials' do
      visit new_user_session_path
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: '???'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'should login with valid credentials' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end
  end
end

require_relative '../spec_helper'

feature 'User reset password in' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'with correct email' do
    BookmarkManager.any_instance.stub(:send_simple_message)
    reset_password('test@test.com')
    user = User.first(email: 'test@test.com')
    visit '/users/reset?token='+ user.password_token
    within '#reset-password-form' do
      expect(page).to have_content('New Password')
    end
  end

  scenario 'with invalid email' do
    reset_password('t@test.com')
    expect(page).to have_content('This email is invalid')
  end

  def reset_password(email)
    visit '/users/reset'
    within '#reset-password' do
      fill_in 'email', with: email
      click_button 'Reset password'
    end
  end
end
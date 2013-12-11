require_relative '../spec_helper'

feature 'User reset password in' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'with correct email' do
    reset_password('test@test.com')
    user = User.first(email: 'test@test.com')
    puts user.inspect
    visit "users/reset/#{user.password_token}"
    expect(page).to have_content('Enter new password:')
  end

  def reset_password(email)
    visit '/users/reset'
    fill_in 'email', with: email
    click_button 'Reset password'


  end
end
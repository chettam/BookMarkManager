require_relative '../spec_helper'

feature 'User browses the list of links' do
  before(:each) { Link.create(title: 'Makers Academy', url: 'http://www.makersacademy.com') }
  scenario 'When opening the home page' do
    visit '/'
    expect(page).to have_content('Makers Academy')
  end

end
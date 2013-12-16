require_relative '../spec_helper'

feature 'User adds a new a new link' do
  before(:each) do
    Link.create(title: 'Makers Academy',
                url: 'http://www.makersacademy.com',
                tags: [Tag.first_or_create(text: 'education')])
    Link.create(url: 'http://www.google.com',
                title: 'Google',
                tags: [Tag.first_or_create(text: 'search')])
    Link.create(url: 'http://www.bing.com',
                title: 'Bing',
                tags: [Tag.first_or_create(text: 'search')])
    Link.create(url: 'http://www.code.org',
                title: 'Code.org',
                tags: [Tag.first_or_create(text: 'education')])

  end
  scenario 'When opening the home page' do
    visit '/'
    expect(page).to have_content('Makers Academy')
  end

  scenario 'filtered by a tag' do
    visit '/tags/search'
    expect(page).not_to have_content('Makers Academy')
    expect(page).not_to have_content('code.org')
    expect(page).to have_content('Google')
    expect(page).to have_content('Bing')
  end

  scenario 'from the homepage using an ajax form', :js => true do
    visit '/'
    click_link 'Add link'
    within('#new-link-form') do
      fill_in 'url',   with: 'http://www.example.com/'
      fill_in 'title', with: 'Example'
      click_button 'Add link'
    end
    expect(page).to have_content('Example')
    expect(current_path).to eq('/') # we're still on the frontpage
  end


end
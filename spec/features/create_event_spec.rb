require 'rails_helper'

RSpec.describe 'Creating an event', type: :feature do
  let!(:user) { User.create(username: 'test') }

  scenario 'create with valid attributes', js: true do
    visit '/login'
    fill_in 'username', with: 'test'
    click_button('Sign In')
    visit new_event_path
    fill_in 'event_title', with: 'Anything'
    fill_in 'event_location', with: 'Anything'
    fill_in 'event_date', with: DateTime.now
    fill_in 'event_description', with: 'Anything'
    click_button('Create')
    expect(page).to have_content('Event created!')
  end
end

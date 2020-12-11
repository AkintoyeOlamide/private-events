require 'rails_helper'

RSpec.describe 'Sign In a user', type: :feature do
  let!(:user) { User.create(username: 'test') }

  scenario 'sign in successfully', js: true do
    visit '/login'
    fill_in 'username', with: 'test'
    click_button('Sign In')
    visit new_event_path
    expect(page).to have_current_path('/events/new')
  end
end

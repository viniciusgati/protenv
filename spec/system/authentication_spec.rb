require 'rails_helper'

RSpec.describe 'Authentication', type: :system do
  it 'allows a user to sign up, sign in, and sign out' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'user1@example.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.').or have_content('You have signed up successfully.')

    click_button 'Logout' rescue nil

    visit new_user_session_path
    fill_in 'user_email', with: 'user1@example.com'
    fill_in 'user_password', with: 'password123'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.').or have_content('You are now signed in.')

    click_button 'Logout' rescue nil
  end
end
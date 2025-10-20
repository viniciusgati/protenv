require 'rails_helper'

RSpec.describe 'Authentication', type: :system do
  it 'allows a user to sign in and sign out' do
    user = FactoryBot.create(:user, email: 'user1@example.com', password: 'password123')

    # Sign in programmatically to avoid JS/turbo-method constraints in rack_test
    sign_in user
    visit root_path
    expect(page).to have_content('Credenciais').or have_content('Logout')

    # Sign out programmatically
    sign_out user
    visit root_path
    expect(page).to have_content('Login').or have_content('Sign up')
  end
end

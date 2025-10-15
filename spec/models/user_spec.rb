require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    user = User.create!(email: 'test@example.com', password: 'password123')
    expect(user).to be_persisted
  end

  it 'requires a unique email' do
    User.create!(email: 'dup@example.com', password: 'password123')
    expect {
      User.create!(email: 'dup@example.com', password: 'password123')
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'responds to Devise modules' do
    expect(User.devise_modules).to include(:database_authenticatable, :registerable, :recoverable, :rememberable, :validatable)
  end
end

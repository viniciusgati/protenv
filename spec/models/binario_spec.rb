require 'rails_helper'

RSpec.describe Binario, type: :model do
  it 'requires name, tipo, url http(s) and auth creds' do
    b = Binario.new
    expect(b).to be_invalid
    b.name='A'; b.tipo=:appserver; b.download_url='https://example.com/x'; b.auth_username='u'; b.auth_password='p'
    expect(b).to be_valid
  end
end

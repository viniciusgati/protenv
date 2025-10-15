require 'rails_helper'

RSpec.describe "binarios/show", type: :view do
  before(:each) do
    assign(:binario, Binario.create!(
      name: "Name",
      tipo: :dbaccess,
      download_url: "https://example.com/dl",
      auth_username: "Auth Username",
      auth_password: "Auth Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/dbaccess/i)
    expect(rendered).to match(/https:\/\//)
    expect(rendered).to match(/Auth Username/)
    expect(rendered).to match(/Auth Password/)
  end
end

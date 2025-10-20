require 'rails_helper'

RSpec.describe "binarios/index", type: :view do
  before(:each) do
    assign(:binarios, [
      Binario.create!(
        name: "Name",
        tipo: :appserver,
        download_url: "https://example.com/a",
        auth_username: "Auth Username",
        auth_password: "Auth Password"
      ),
      Binario.create!(
        name: "Name",
        tipo: :dbaccess,
        download_url: "https://example.com/b",
        auth_username: "Auth Username",
        auth_password: "Auth Password"
      )
    ])
  end

  it "renders a list of binarios" do
    render
    assert_select 'table tbody tr', count: 2
    assert_select 'table tbody tr td', text: /Name/, count: 2
    assert_select 'table tbody tr td', text: /appserver|dbaccess/i, count: 2
    assert_select 'table tbody tr td', text: /https:\/\//, count: 2
    assert_select 'table tbody tr td', text: /Auth Username/, count: 2
  end
end

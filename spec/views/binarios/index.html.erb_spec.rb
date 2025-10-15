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
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: /appserver|dbaccess/i, count: 2
    assert_select cell_selector, text: /https:\/\//, count: 2
    assert_select cell_selector, text: Regexp.new("Auth Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Auth Password".to_s), count: 2
  end
end

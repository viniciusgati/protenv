require 'rails_helper'

RSpec.describe "binarios/new", type: :view do
  before(:each) do
    assign(:binario, Binario.new(
      name: "MyString",
      tipo: 1,
      download_url: "MyString",
      auth_username: "MyString",
      auth_password: "MyString"
    ))
  end

  it "renders new binario form" do
    render

    assert_select "form[action=?][method=?]", binarios_path, "post" do

      assert_select "input[name=?]", "binario[name]"

      assert_select "select[name=?]", "binario[tipo]"

      assert_select "input[name=?]", "binario[download_url]"

      assert_select "input[name=?]", "binario[auth_username]"

      assert_select "input[name=?]", "binario[auth_password]"
    end
  end
end

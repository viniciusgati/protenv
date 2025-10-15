require 'rails_helper'

RSpec.describe "binarios/edit", type: :view do
  let(:binario) {
    Binario.create!(
      name: "MyString",
      tipo: 1,
      download_url: "https://example.com/z",
      auth_username: "MyString",
      auth_password: "MyString"
    )
  }

  before(:each) do
    assign(:binario, binario)
  end

  it "renders the edit binario form" do
    render

    assert_select "form[action=?][method=?]", binario_path(binario), "post" do

      assert_select "input[name=?]", "binario[name]"

      assert_select "select[name=?]", "binario[tipo]"

      assert_select "input[name=?]", "binario[download_url]"

      assert_select "input[name=?]", "binario[auth_username]"

      assert_select "input[name=?]", "binario[auth_password]"
    end
  end
end

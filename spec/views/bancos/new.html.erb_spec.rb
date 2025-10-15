require 'rails_helper'

RSpec.describe "bancos/new", type: :view do
  before(:each) do
    assign(:banco, Banco.new(
      name: "MyString",
      tipo: 1
    ))
  end

  it "renders new banco form" do
    render

    assert_select "form[action=?][method=?]", bancos_path, "post" do

      assert_select "input[name=?]", "banco[name]"

      assert_select "select[name=?]", "banco[tipo]"
    end
  end
end

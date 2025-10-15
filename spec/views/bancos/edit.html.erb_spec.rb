require 'rails_helper'

RSpec.describe "bancos/edit", type: :view do
  let(:banco) {
    Banco.create!(
      name: "MyString",
      tipo: 1
    )
  }

  before(:each) do
    assign(:banco, banco)
  end

  it "renders the edit banco form" do
    render

    assert_select "form[action=?][method=?]", banco_path(banco), "post" do

      assert_select "input[name=?]", "banco[name]"

      assert_select "select[name=?]", "banco[tipo]"
    end
  end
end

require 'rails_helper'

RSpec.describe "instalacaos/new", type: :view do
  before(:each) do
    assign(:instalacao, Instalacao.new(
      name: "MyString",
      appserver_binario: nil,
      dbaccess_binario: nil,
      banco: nil
    ))
  end

  it "renders new instalacao form" do
    render

    assert_select "form[action=?][method=?]", instalacaos_path, "post" do

      assert_select "input[name=?]", "instalacao[name]"

      assert_select "select[name=?]", "instalacao[appserver_binario_id]"

      assert_select "select[name=?]", "instalacao[dbaccess_binario_id]"

      assert_select "select[name=?]", "instalacao[banco_id]"
    end
  end
end

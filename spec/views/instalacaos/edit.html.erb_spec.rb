require 'rails_helper'

RSpec.describe "instalacaos/edit", type: :view do
  let(:instalacao) {
    Instalacao.create!(
      name: "MyString",
      appserver_binario: FactoryBot.create(:binario, tipo: :appserver),
      dbaccess_binario: FactoryBot.create(:binario, tipo: :dbaccess),
      banco: FactoryBot.create(:banco),
      user: FactoryBot.create(:user)
    )
  }

  before(:each) do
    assign(:instalacao, instalacao)
  end

  it "renders the edit instalacao form" do
    render

    assert_select "form[action=?][method=?]", instalacao_path(instalacao), "post" do

      assert_select "input[name=?]", "instalacao[name]"

      assert_select "select[name=?]", "instalacao[appserver_binario_id]"

      assert_select "select[name=?]", "instalacao[dbaccess_binario_id]"

      assert_select "select[name=?]", "instalacao[banco_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "instalacaos/index", type: :view do
  before(:each) do
    assign(:instalacaos, [
      Instalacao.create!(
        name: "Name",
        appserver_binario: FactoryBot.create(:binario, tipo: :appserver),
        dbaccess_binario: FactoryBot.create(:binario, tipo: :dbaccess),
        banco: FactoryBot.create(:banco),
        user: FactoryBot.create(:user)
      ),
      Instalacao.create!(
        name: "Name",
        appserver_binario: FactoryBot.create(:binario, tipo: :appserver),
        dbaccess_binario: FactoryBot.create(:binario, tipo: :dbaccess),
        banco: FactoryBot.create(:banco),
        user: FactoryBot.create(:user)
      )
    ])
  end

  it "renders a list of instalacaos" do
    render
    assert_select 'table tbody tr', count: 2
    assert_select 'table tbody tr td', text: /Name/, minimum: 2
  end
end

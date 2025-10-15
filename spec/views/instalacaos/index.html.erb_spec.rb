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
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    # columns render names and ids; just ensure we have the app names twice
    assert_select cell_selector, text: /Name/, count: 2
  end
end

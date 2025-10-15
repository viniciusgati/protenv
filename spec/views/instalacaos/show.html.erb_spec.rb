require 'rails_helper'

RSpec.describe "instalacaos/show", type: :view do
  before(:each) do
    assign(:instalacao, Instalacao.create!(
      name: "Name",
      appserver_binario: FactoryBot.create(:binario, tipo: :appserver),
      dbaccess_binario: FactoryBot.create(:binario, tipo: :dbaccess),
      banco: FactoryBot.create(:banco),
      user: FactoryBot.create(:user)
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

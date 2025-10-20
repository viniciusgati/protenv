require 'rails_helper'

RSpec.describe "bancos/index", type: :view do
  before(:each) do
    assign(:bancos, [
      Banco.create!(
        name: "Name",
        tipo: :postgres
      ),
      Banco.create!(
        name: "Name",
        tipo: :postgres
      )
    ])
  end

  it "renders a list of bancos" do
    render
    assert_select 'table tbody tr', count: 2
    assert_select 'table tbody tr td', text: /Name/, count: 2
    assert_select 'table tbody tr td', text: /postgres/i, count: 2
  end
end

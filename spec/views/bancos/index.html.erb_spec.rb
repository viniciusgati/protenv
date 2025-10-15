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
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: /postgres/i, count: 2
  end
end

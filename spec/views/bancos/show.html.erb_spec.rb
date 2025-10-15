require 'rails_helper'

RSpec.describe "bancos/show", type: :view do
  before(:each) do
    assign(:banco, Banco.create!(
      name: "Name",
      tipo: :oracle
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/oracle/i)
  end
end

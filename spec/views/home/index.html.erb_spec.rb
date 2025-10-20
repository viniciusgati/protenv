require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it 'renders dashboard for signed in user with filters' do
    assign(:appservers, [])
    assign(:dbaccesses, [])
    assign(:instalacaos, [])
    allow(view).to receive(:user_signed_in?).and_return(true)
    allow(view).to receive(:current_user).and_return(FactoryBot.build(:user))
    render
    expect(rendered).to include('Minhas Instalações')
    expect(rendered).to include('Filtrar')
  end
end

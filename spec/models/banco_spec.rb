require 'rails_helper'

RSpec.describe Banco, type: :model do
  it 'validates presence and enum' do
    banco = Banco.new(name: nil, tipo: nil)
    expect(banco).to be_invalid
    banco.name = 'X'; banco.tipo = :postgres
    expect(banco).to be_valid
    expect(Banco.tipos.keys).to include('sqlserver', 'oracle', 'postgres')
  end
end

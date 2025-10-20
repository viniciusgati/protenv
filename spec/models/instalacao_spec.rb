require 'rails_helper'

RSpec.describe Instalacao, type: :model do
  it 'enforces binario types and user' do
    app = FactoryBot.create(:binario, tipo: :appserver)
    db  = FactoryBot.create(:binario, :dbaccess)
    banco = FactoryBot.create(:banco)
    user = FactoryBot.create(:user)
    inst = Instalacao.new(name:'I', appserver_binario: app, dbaccess_binario: db, banco: banco, user: user)
    expect(inst).to be_valid
    inst.appserver_binario = db
    expect(inst).to be_invalid
  end
end

FactoryBot.define do
  factory :instalacao do
    name { "Instância" }
    association :appserver_binario, factory: :binario
    association :dbaccess_binario, factory: [:binario, :dbaccess]
    association :banco
    association :user
  end
end

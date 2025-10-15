FactoryBot.define do
  factory :binario do
    name { "My Bin" }
    tipo { :appserver }
    download_url { "https://example.com/file.tar.gz" }
    auth_username { "user" }
    auth_password { "pass" }

    trait :dbaccess do
      tipo { :dbaccess }
    end
  end
end

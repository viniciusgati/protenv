FactoryBot.define do
  factory :download_task do
    instalacao { nil }
    binario { nil }
    status { 1 }
    progress { 1 }
    error_message { "MyText" }
  end
end

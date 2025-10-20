require 'rails_helper'

RSpec.describe DownloadTask, type: :model do
  it 'has status enum and progress range' do
    inst = FactoryBot.create(:instalacao)
    bin  = FactoryBot.create(:binario)
    t = DownloadTask.new(instalacao: inst, binario: bin, status: :queued, progress: 0)
    expect(t).to be_valid
    t.progress = 101
    expect(t).not_to be_valid
  end
end

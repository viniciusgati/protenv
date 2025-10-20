class DownloadTask < ApplicationRecord
  belongs_to :instalacao
  belongs_to :binario

  has_one_attached :artifact

  enum :status, { queued: 0, running: 1, done: 2, failed: 3 }
  validates :progress, inclusion: { in: 0..100 }
end

class Banco < ApplicationRecord
  enum :tipo, { sqlserver: 0, oracle: 1, postgres: 2 }, prefix: true

  has_one_attached :backup

  validates :name, presence: true
  validates :tipo, presence: true
end

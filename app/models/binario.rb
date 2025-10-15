class Binario < ApplicationRecord
  enum :tipo, { appserver: 0, dbaccess: 1 }

  validates :name, presence: true
  validates :tipo, presence: true
  validates :download_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid http(s) URL" }
  validates :auth_username, presence: true
  validates :auth_password, presence: true
end

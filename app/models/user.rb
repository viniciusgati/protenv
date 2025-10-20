class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :instalacaos, dependent: :destroy
  has_one_attached :avatar

  # Rails Active Record Encryption (encrypted at rest with app key)
  encrypts :totvs_username
  encrypts :totvs_password

  def display_name
    name.presence || email
  end
end

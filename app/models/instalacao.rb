class Instalacao < ApplicationRecord
  belongs_to :appserver_binario, class_name: "Binario"
  belongs_to :dbaccess_binario, class_name: "Binario"
  belongs_to :banco
  belongs_to :user

  validates :name, presence: true
  validate :binario_types_match

  private

  def binario_types_match
    if appserver_binario && !appserver_binario.appserver?
      errors.add(:appserver_binario, "deve ser do tipo appserver")
    end
    if dbaccess_binario && !dbaccess_binario.dbaccess?
      errors.add(:dbaccess_binario, "deve ser do tipo dbaccess")
    end
  end
end

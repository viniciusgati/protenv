class AddUserToInstalacaos < ActiveRecord::Migration[8.0]
  def change
    add_reference :instalacaos, :user, null: false, foreign_key: true
  end
end

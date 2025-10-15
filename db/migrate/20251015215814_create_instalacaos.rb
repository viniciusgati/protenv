class CreateInstalacaos < ActiveRecord::Migration[8.0]
  def change
    create_table :instalacaos do |t|
      t.string :name
      t.references :appserver_binario, null: false, foreign_key: { to_table: :binarios }
      t.references :dbaccess_binario, null: false, foreign_key: { to_table: :binarios }
      t.references :banco, null: false, foreign_key: true

      t.timestamps
    end
  end
end

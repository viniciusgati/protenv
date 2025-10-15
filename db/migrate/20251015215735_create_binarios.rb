class CreateBinarios < ActiveRecord::Migration[8.0]
  def change
    create_table :binarios do |t|
      t.string :name
      t.integer :tipo
      t.string :download_url
      t.string :auth_username
      t.string :auth_password

      t.timestamps
    end
  end
end

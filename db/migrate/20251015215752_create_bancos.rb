class CreateBancos < ActiveRecord::Migration[8.0]
  def change
    create_table :bancos do |t|
      t.string :name
      t.integer :tipo

      t.timestamps
    end
  end
end

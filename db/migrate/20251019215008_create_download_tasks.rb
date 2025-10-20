class CreateDownloadTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :download_tasks do |t|
      t.references :instalacao, null: false, foreign_key: true
      t.references :binario, null: false, foreign_key: true
      t.integer :status
      t.integer :progress
      t.text :error_message

      t.timestamps
    end
  end
end

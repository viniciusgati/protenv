class AddTotvsCredsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :totvs_username, :text
    add_column :users, :totvs_password, :text
  end
end

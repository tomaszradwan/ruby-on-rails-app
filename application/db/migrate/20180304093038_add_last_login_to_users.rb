class AddLastLoginToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_login, :string
  end
end

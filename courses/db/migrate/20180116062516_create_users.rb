class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
    	t.string "name", :limit => 20
    	t.string "surname", :limit => 60
    	t.string "user", :limit => 30
    	t.string "email", :limit => 100, :default => "", :null => false
    	t.string "phone", :default => "", :null => false
    	t.string "password_digest"
      t.timestamps
    end
    add_index("users", "user")
  end

  def down
  	drop_table :users
  end	
end

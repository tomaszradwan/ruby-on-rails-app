class CreateArticles < ActiveRecord::Migration[5.1]
  def up
    create_table :articles do |t|
    	t.integer "page_id"
    	t.string "name"
    	t.integer "position"
    	t.boolean "visibility", :default => true
    	t.text "describe"
    	t.attachment :photo
      t.timestamps
    end
  end

  def down
  	drop_table :articles
  end	
end

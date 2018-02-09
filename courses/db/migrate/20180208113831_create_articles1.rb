class CreateArticles1 < ActiveRecord::Migration[5.1]
  def up
    create_table :articles do |t|
      t.integer "page_id"
      t.string "name", :default => 'none'
      t.integer "position", :default => 0
      t.boolean "visibility", :default => true
      t.text "content", :default => 'none'
      t.attachment :photo
      t.timestamps
    end
  end

  def down
    drop_table :articles
  end 
end

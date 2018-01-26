class CreatePhotos < ActiveRecord::Migration[5.1]
  def up
    create_table :photos do |t|
    	t.integer "gallery_id"
    	t.string "name"
    	t.integer "position"
    	t.boolean "visibility", :default => true
    	t.string "describe"
    	t.attachment :photo
      t.timestamps
    end
  end

  def down
  	drop_table :photos
  end
end

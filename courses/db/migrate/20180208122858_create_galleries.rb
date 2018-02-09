class CreateGalleries < ActiveRecord::Migration[5.1]
  def up
    create_table :galleries do |t|
      t.string "name"
      t.integer "position"
      t.text "describe", :default => ""
      t.boolean "visibility", :default => false
      t.attachment :photo
      t.timestamps
    end
  end

  def down
    drop_table :galleries
  end
end

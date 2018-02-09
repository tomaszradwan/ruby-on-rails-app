class CreateCategories < ActiveRecord::Migration[5.1]
  def up
    create_table :categories do |t|
      t.string "name", :null => false
      t.integer "position"
      t.boolean "visibility", :default => true
      t.timestamps
    end
  end

  def dowm
    drop_table :categories
  end
end

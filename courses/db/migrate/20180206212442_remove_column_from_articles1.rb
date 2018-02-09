class RemoveColumnFromArticles1 < ActiveRecord::Migration[5.1]
  def change
  	remove_column :articles, :photos_file_name
  	remove_column :articles, :photos_content_type
  	remove_column :articles, :photos_file_size
  	remove_column :articles, :photos_updated_at
  end
end

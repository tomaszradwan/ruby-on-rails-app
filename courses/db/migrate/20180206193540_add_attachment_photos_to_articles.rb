class AddAttachmentPhotosToArticles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :articles do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :articles, :photos
  end
end

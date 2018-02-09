class RemoveAvatar < ActiveRecord::Migration[5.1]
  def change
      remove_column :articles, :avatar
  end
end

class RemoveTagsFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :tags, :string
  end
end

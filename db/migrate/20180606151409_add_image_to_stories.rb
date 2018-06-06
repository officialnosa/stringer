class AddImageToStories < ActiveRecord::Migration
  def change
    add_column :stories, :image, :text
  end
end

class RemoveSubtitleFromBlogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :subtitle, :string
  end
end

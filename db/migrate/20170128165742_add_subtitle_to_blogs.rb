class AddSubtitleToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :subtitle, :string
  end
end

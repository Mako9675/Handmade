class CreatePostGenres < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_genres,:post_id, :integer
    remove_column :post_genres,:genre_id, :integer
  
  end
end

class DeletePostGenre < ActiveRecord::Migration[6.1]
  def change
    drop_table :post_genres
  end
end

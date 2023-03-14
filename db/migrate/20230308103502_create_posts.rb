class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.integer :user_id,               null: false, default: "", foreign_key: true
      t.integer :genre_id,              null: false, default: "", foreign_key: true
      t.string :title,               null: false
      t.string :material,            null: false
      t.string :body,                null: false
      t.boolean :is_draft, null: false
    end
  end
end

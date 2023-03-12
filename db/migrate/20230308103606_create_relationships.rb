class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|

      t.timestamps
      t.integer "followed_id", null: false, foreign_key: { to_table: :users }
      t.integer "follower_id", null: false, foreign_key: { to_table: :users }
    end
  end
end

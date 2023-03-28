class AddForeignKeyToLikes < ActiveRecord::Migration[7.0]
  def change
  add_foreign_key :likes, :posts, column: :post_id
  add_foreign_key :likes, :users, column: :user_id
  add_index :likes, :post_id
  add_index :likes, :user_id
  end
end

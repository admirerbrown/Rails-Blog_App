class AddForeignKeyToPosts < ActiveRecord::Migration[7.0]
  def change
  add_foreign_key :posts, :users, column: :author_id
  add_index :posts, :author_id
  end
end

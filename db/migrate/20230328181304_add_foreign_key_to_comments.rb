class AddForeignKeyToComments < ActiveRecord::Migration[7.0]
  def change
  add_foreign_key :comments, :posts, column: :post_id
  add_index :comments, :post_id

  end

end

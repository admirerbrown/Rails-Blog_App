class ChangePostsCountToPostCounterInUsers < ActiveRecord::Migration[7.0]
  def change
  rename_column :users, :posts_count, :posts_counter
  end
end

class AddIndexToPostsUserId < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :user_id, null: false
  end
end

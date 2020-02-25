class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :list_id, null: false, index: true
      t.string :image_id, null: false
      t.text :body
      
      t.timestamps
    end
  end
end

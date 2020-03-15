class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :user_id, null: false, index: true
      t.string :title, null: false
      t.text :body
      t.date :departure_date
      t.date :return_date

      t.timestamps
    end
  end
end

class CreateUserRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rooms do |t|
      t.integer :user_id, null:false, index:true
      t.integer :room_id, null:false, index:true

      t.timestamps
    end
  end
end

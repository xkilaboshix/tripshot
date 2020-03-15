class ChandeOwnerIdColumnOnRooms < ActiveRecord::Migration[5.2]
  def change
    change_column :rooms, :owner_id, :integer, null: false

  end
end

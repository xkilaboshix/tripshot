class UserRoomsController < ApplicationController
  def create
    joined_room = UserRoom.where(user_id: current_user.id, room_id: params[:room_id])
    if joined_room.blank?
      user_room = UserRoom.new(room_id: params[:room_id])
      user_room.user_id = current_user.id
      user_room.save
      redirect_to room_path(params[:room_id])
    else
      redirect_to room_path(params[:room_id])
    end
    
  end
  
end

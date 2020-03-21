class UserRoomsController < ApplicationController
  
  def create
    joined_room = UserRoom.where(user_id: current_user.id, room_id: params[:user_room][:room_id])
    if joined_room.blank?
      @user_room = UserRoom.new(user_room_params)
      @user_room.save
      redirect_to room_path(params[:user_room][:room_id])
    else
      redirect_to room_path(params[:user_room][:room_id])
    end
  end

  private
  def user_room_params
    params.require(:user_room).permit(:user_id, :room_id)
  end
end

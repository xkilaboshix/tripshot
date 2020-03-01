class RoomsController < ApplicationController
  before_action :correct_owner, only: [:destroy]

  def index
    @room = Room.new
    @rooms = Room.all
  end
  def create
    @room = Room.new(room_params)
    @room.owner_id = current_user.id
    @room.save
    redirect_to rooms_path
  end
  def show
    @room = Room.find(params[:id])
    @messages = @room.chats
  end
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
  
  def correct_owner
    room = Room.find(params[:id])
    if current_user.id != room.owner_id
      redirect_to rooms_path
    end
  end
end

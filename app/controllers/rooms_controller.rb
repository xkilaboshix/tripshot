class RoomsController < ApplicationController
  def index
    @room = Room.new
    @rooms = Room.all
  end
  def create
    @room = Room.new(room_params)
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
    
end

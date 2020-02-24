class ListsController < ApplicationController
  def new
    @list = List.new
    @lists = List.all
  end
  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end
  def show
    
  end
  def edit
    
  end
  def update
    
  end
  def destroy
    
  end

  private
  def list_params
    params.require(:list).permit(:user_id, :title, :body, :departure_date, :return_date, :tag_list)
  end
end

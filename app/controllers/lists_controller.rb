class ListsController < ApplicationController
  def new
    @list = List.new
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
    @list = List.find(params[:id])
    @post = Post.new
    @posts = Post.where(user_id: current_user.id)
  end
  def edit
    @list = List.find(params[:id])
  end
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render 'edit'
    end
  end
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to user_path(current_user) 
  end

  private
  def list_params
    params.require(:list).permit(:user_id, :title, :body, :departure_date, :return_date, :tag_list)
  end
end

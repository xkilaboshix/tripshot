class ListsController < ApplicationController
before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      user = User.find(current_user.id)
      user.achievement = achievement_calcurate
      user.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    if request.from_pc?
      @posts = Post.where(list_id: params[:id]).page(params[:page]).reverse_order
    else
      @posts = Post.where(list_id: params[:id]).reverse_order
    end
    
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
    if @list.destroy
      user = User.find(current_user.id)
      user.achievement = achievement_calcurate
      user.save
      redirect_to user_path(current_user) 
    end
  end

  private
  def list_params
    params.require(:list).permit(:user_id, :title, :body, :departure_date, :return_date, :tag_list)
  end

  def correct_user
    list = List.find(params[:id])
    if current_user.id != list.user_id
      redirect_to user_path(current_user)
    end
  end
  
  # create,destroy時に称号変更
  def achievement_calcurate
    lists_count = List.where(user_id: current_user).count
    if lists_count > 10
      achievement = "果てなき冒険者"
    elsif lists_count > 4
      achievement = "旅マスター"
    elsif lists_count > 2
      achievement = "旅好き"
    else
      achievement = "旅見習い"
    end
    return achievement
  end

end

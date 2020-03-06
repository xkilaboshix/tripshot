class SearchsController < ApplicationController
  
  def search
    if params[:select] == "ユーザー"
      @users = User.where(['name LIKE ?', "%#{params[:search]}%"])
    elsif params[:select] == "リスト名"
      @lists = List.where(['title LIKE ?', "%#{params[:search]}%"]).pluck(:id)
      session[:list_id] = @lists
      redirect_to search_list_path
    elsif params[:select] == "リストのタグ"
      @lists = List.tagged_with(params[:search], wild: true, any: true).pluck(:id)
      session[:list_id] = @lists
      redirect_to search_tag_path
    end
  end

  def search_list
    @lists = List.where(id: session[:list_id])
    session[:list_id].clear
  end

  def search_tag 
    @lists = List.where(id: session[:list_id])
    session[:list_id].clear
  end
end

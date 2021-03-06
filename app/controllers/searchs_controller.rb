class SearchsController < ApplicationController
  
  def search
    if params[:search] == ""
      redirect_back(fallback_location: root_path)
    elsif params[:select] == "ユーザー"
      @users = User.where(['name LIKE ?', "%#{params[:search]}%"]).where(id: active_user_id)
    elsif params[:select] == "リスト名"
      @lists = List.where(['title LIKE ?', "%#{params[:search]}%"]).where(user_id: active_user_id).pluck(:id)
      session[:list_id] = @lists
      redirect_to search_list_path
    elsif params[:select] == "リストのタグ"
      @lists = List.where(user_id: active_user_id).tagged_with(params[:search], wild: true, any: true).pluck(:id)
      session[:list_id] = @lists
      redirect_to search_tag_path
    end
  end

  def search_list
    @lists = List.where(id: session[:list_id])
    # 検索結果がリロードで消えるのでコメントアウト
    # session[:list_id].clear
  end

  def search_tag 
    @lists = List.where(id: session[:list_id]).page(params[:page]).reverse_order
    # session[:list_id].clear
  end
end

class PostsController < ApplicationController
  before_action :correct_user, except: [:create, :index, :show]

  def index
    @posts = Post.all
    @favorite_ranks = week_post_calculate[0..2]
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to list_path(@post.list_id)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'      
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to list_path(@post.list_id)
  end


  private

  def post_params
    params.require(:post).permit(:list_id, :image, :body)
  end

  def correct_user
    post = Post.find(params[:id])
    if current_user.id != post.user_id
      redirect_to user_path(current_user)
    end
  end
  
    # 一週間のお気に入りランキングを計算
  def week_post_calculate
    today = Date.today
    past_date = today - 7
    
    # 全てのお気に入りランキングをとってくる
    favorite_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    week_rank = []
    favorite_ranks.each do |post|
      if post.created_at > past_date
        week_rank += Post.where(created_at: post.created_at)
      end
    end  
    return  week_rank
  end
end

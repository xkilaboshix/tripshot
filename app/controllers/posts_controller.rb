class PostsController < ApplicationController
  before_action :correct_user, except: [:new, :create, :index, :show]
  
  def new
    @post = Post.new
  end

  def index
      @first_rank = week_post_calculate[0]
      @second_rank = week_post_calculate[1]
      @third_rank = week_post_calculate[2]

      @posts = Post.page(params[:page]).per(10).reverse_order
      @favorite_ranks = week_post_calculate
  end

  def create
    @post = Post.new(post_params)   
    @post.list_id = params[:post][:list_id]
    @post.user_id = current_user.id
    @post.save
    redirect_to list_path(params[:post][:list_id])
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

    # 一週間以内の投稿をとってくる
    posts = Post.where("created_at > ?", 7.days.ago)
    # お気に入りの多い順に並べてidをとる
    post_ids = Favorite.where(post_id: posts.pluck(:id)).group(:post_id).order('count(post_id) DESC').pluck(:post_id)
    post_ranks_ids = post_ids.first(3)

    post_ranks = []

    post_ranks_ids.each do |id|
      post_ranks += posts.select{|post| post.id == id }
    end
    return post_ranks
  end

end

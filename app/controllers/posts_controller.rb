class PostsController < ApplicationController
  # ***** 以下を追加 *****
  before_action :set_post, only: %i[show edit update destroy]
  # ***** 以上を追加 *****

  def index
    @posts = Post.order(id: :asc)
  end

  def show
    # ***** 修正 *****
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    # ***** 修正 *****
  end

  def update
    # ***** 以下を修正 *****
    if @post.update(post_params)
      flash[:notice] = "編集しました"
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy!
    flash[:alert] = "削除しました"
    redirect_to @post
  end

  private

  # ***** 以下を追加 *****
  def set_post
    @post = Post.find(params[:id])
  end

  # ***** 以上を追加 *****

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

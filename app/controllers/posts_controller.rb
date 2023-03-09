class PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), notice: "投稿が完了しました."
    else
      @user = current_user
      @post = Post.new
      render :new
    end
  end

  def index
    @posts = Post.all
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :material, :body, :genre_id)
  end
end

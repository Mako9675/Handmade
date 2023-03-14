class PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if params[:post]
      if @post.save(context: :publicize)
        redirect_to post_path(@post.id), notice: "投稿が完了しました."
      else
        flash[:notice] = "投稿に失敗しました"
        @user = current_user
        @post = Post.new
        render :new
      end
    else
      if @post.update(is_draft: true)
        redirect_to public_user(current_user), notice: "下書きに保存しました"
      else
        flash[:notice] = "下書き保存に失敗しました"
        render :new
      end
    end
  end

  def index
    
    @posts = Post.all
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @genres = Genre.all
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if params[:publicize_draft]
      @post.attributes = post_params.merge(is_draft: false)
      if @post.save(context: :publicize)
        redirect_to post_path(@post.id)
        flash[:notice] = "下書きを公開しました"
      else
        @post.is_draft = true
        render :edit, alert: "下書きの公開に失敗しました"
      end
      
    elsif params[:update_post]
      @post.attributes = post_params
      if @post.save(context: :publicize)
        redirect_to post_path(@post.id)
        flash[:notice] = "投稿を修正しました"
      else
        render :edit
        flash[:notice] = "修正に失敗しました"
      end
    else
      if @post.update(post_params)
        redirect_to post_path(@post.id)
        flash[:notice] = "下書きを修正しました"
      else
        render :edit
        flash[:notice] = "修正に失敗しました"
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to posts_path
    else
      flash[:notice] = "削除に失敗しました"
      render 'show'
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :material, :body, :genre_id,:is_draft,:post_image)
  end
  
  
end

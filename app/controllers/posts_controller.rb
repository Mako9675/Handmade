class PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
    @material = @post.post_materials.build
    @body = @post.post_makes.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to post_path(@post.id), notice: "投稿が完了しました."
    else
      flash[:notice] = "投稿に失敗しました"
      @validation_errors = @post.errors&.full_messages || []
      @user = current_user
      @post = Post.new
      @material = @post.post_materials.build
      @body = @post.post_makes.build
      render :new
    end
  end

  def index
    @posts = Post.published.page(params[:page]).per(10).reverse_order
    @posts = @posts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @genres = Genre.all
    @comment = Comment.new
    @genre = @post.genre
    @materials = @post.post_materials
    @makes = @post.post_makes
  end

  def edit
    @post = Post.find(params[:id])
    
    
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を修正しました"
      redirect_to post_path
    else
      flash[:notice] = "修正に失敗しました"
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to public_user_path(current_user)
    else
      flash[:notice] = "削除に失敗しました"
      render 'show'
    end
  end
  
  def confirm
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
    @genres = Genre.all
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :material, :body, :genre_id,:status,:post_image,
                                 post_materials_attributes:[:id, :post_id, :ing_name, :quantity, :_destroy],
                                 post_makes_attributes:[:id, :explanation, :order_no, :make_image, :_destroy])
                                 .merge(user_id: current_user.id)
  end
  
  
end

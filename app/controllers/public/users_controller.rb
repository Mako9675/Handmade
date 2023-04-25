class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:update, :edit, ]
  before_action :set_user, only: [:followings, :followers, :favorites]
  
  def show
    @user = User.find(params[:id])
    @genres = Genre.all
    @posts = @user.posts.published
    @follow = @user.followings
    @follower = @user.followers
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_user_path(@user), notice: "プロフィールを更新しました."
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end

  def favorites
    @genres = Genre.all
    
    user = User.find(params[:id])
    favorites = Favorite.where(user_id: user.id).pluck(:post_id)
    @favorite_posts = Post.page(params[:page]).find(favorites)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to public_user_path(current_user)
    end
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  
end

class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :is_matching_login_user, only: [:update, :edit, ]
  
  
  def show
    @user = User.find(params[:id])
    @genres = Genre.all
    @posts = @user.posts
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

  
  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end

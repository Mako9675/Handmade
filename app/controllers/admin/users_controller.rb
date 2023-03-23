class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, except: [:top]
  before_action :is_matching_login_admin, only: [:update, :edit, ]
  
  def index
    @users = User.all.page(params[:page]).per(10)
    @genres = Genre.all
  end

  def show
    @user = User.find(params[:id])
    @genres = Genre.all
    @posts = @user.posts
    @follow = @user.followings
    @follower = @user.followers
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if@user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end
  
  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: !@user.is_deleted)
    
    if @user.is_deleted
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to admin_users_path
    else
      flash[:notice] = "有効にします"
      redirect_to admin_user_path(@user.id)
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :introduction, :profile_image)
    end
end

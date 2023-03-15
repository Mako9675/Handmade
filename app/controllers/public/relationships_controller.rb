class Public::RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy, :followings, :followers, ]
  
  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    @follower = @user.followers
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
    @follower = @user.followers
  end
  
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
    @genres = Genre.all
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
    @genres = Genre.all
  end
  
  private
    def set_user
      @user = User.find(params[:user_id])
    end
    
end

class RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy, :followings, :followers, ]
  
  def create
    @user = User.find(params[:user_id])
    following = current_user.follow(@user)
    following.save
  end

  def destroy
    @user = User.find(params[:user_id])
    following = current_user.follow(@user)
    following.destroy
  end
  
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
  private
    def set_user
      @user = User.find(params[:user_id])
    end
    
end

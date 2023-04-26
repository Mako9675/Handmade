class Admin::OwnersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genres = Genre.all
    @owners = Admin.all.page(params[:page]).per(10)
  end
  
  def show
    @genres = Genre.all
    @owner = Admin.find(params[:id])
  end

  def edit
    render :layout => 'nosidebar'
    @owner = Admin.find(params[:id])
  end
  
  def update
    @owner = Admin.find(params[:id])
    if @owner.update(admin_params)
      redirect_to admin_owner_path(current_admin), notice: "プロフィールを更新しました."
    else
      render :edit
    end
  end
  
  private
  def admin_params
    params.require(:admin).permit(:name, :email, :introduction, :owner_image)
  end
  
end

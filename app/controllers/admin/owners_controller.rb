class Admin::OwnersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @genres = Genre.all
    @owner = Admin.find(params[:id])
  end

  def edit
    @owner = Admin.find(params[:id])
  end
  
  def update
    @owner = Admin.find(params[:id])
    if @owner.update(admin_params)
      redirect_to admin_owners_path, notice: "プロフィールを更新しました."
    else
      render :edit
    end
  end
  
  private
  def admin_params
    params.require(:admin).permit( :name, :email, :introduction, :owner_image)
  end
  
end

class Admin::OwnersController < ApplicationController
  
  def show
    @owner = Admin.find(1)
  end

  def edit
    @owner = Admin.find(1)
  end
  
  def update
    @owner = Admin.find(1)
    if @owner.update(admin_params)
      redirect_to admin_owners_path, notice: "プロフィールを更新しました."
    else
      render :edit
    end
  end
  
  private
  def admin_params
    params.require(:admin).permit(:name, :email, :introduction, :owner_image)
  end
  
end

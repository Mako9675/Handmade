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
    @owner = Admin.find(params[:id])
    render :layout => 'nosidebar'
  end
  
  def update
    @owner = Admin.find(params[:id])
    if @owner.update(admin_params)
      redirect_to admin_owner_path(current_admin), notice: "プロフィールを更新しました."
    else
      render :edit
    end
  end
  
  def add
    @admin = Admin.new
    render :layout => 'nosidebar'
  end
  
  def admin_create

    if @admin = Admin.create!(
      name: params[:admin][:name],#'管理者',
      email: params[:admin][:email],#'test@test.com',
      password: params[:admin][:password]#'testtest',
    )
    
    redirect_to admin_owners_path, notice: "管理者を作成しました."
    
    else
      flash[:notice] = "修正に失敗しました"
      redirect_to admin_owners_path
    end
  end
  
  def admin_destroy
    @owner = Admin.find(params[:id])
    if @owner.destroy
      redirect_to admin_owners_path, notice: "管理者を削除しました."
    else
      flash[:notice] = "削除に失敗しました"
      redirect_to admin_owners_path
    end
  end
  
  
  private
  def admin_params
    params.require(:admin).permit(:name, :email, :introduction, :owner_image)
  end
  
end

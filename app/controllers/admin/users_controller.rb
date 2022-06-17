class Admin::UsersController < ApplicationController
before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "登録に成功しました"
      redirect_to admin_user_path(@user.id)
    else
      flash[:notice] = "登録に失敗しました"
      render :edit
    end
  end

  private
   def user_params
     params.require(:user).permit(:is_active)
   end

end

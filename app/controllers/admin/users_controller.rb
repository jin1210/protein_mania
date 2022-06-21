class Admin::UsersController < ApplicationController
before_action :authenticate_admin!
  def index
    @users = User.all.page(params[:page]).per(8)
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
      redirect_to admin_user_path(@user.id), notice: '変更に成功しました'
    else
      flash.now.notice = "変更に失敗しました"
      render :edit
    end
  end

  private
   def user_params
     params.require(:user).permit(:is_active)
   end

end

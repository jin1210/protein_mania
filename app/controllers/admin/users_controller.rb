class Admin::UsersController < ApplicationController

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
      flash[:notice] = "successfully"
      redirect_to admin_user(@user.id)
    else
      flash[:notice] = "unsuccessful"
      render :edit
    end
  end

  private
   def user_params
     params.require(:user).permit(:is_active)
   end

end

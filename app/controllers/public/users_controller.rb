class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "unsuccessful"
      render :edit
    end
  end

  def confirmation
  end

  def withdrawal
  end

  private
  def user_params
    params.require(:user).permit(:name, :is_active, :image)
  end

end

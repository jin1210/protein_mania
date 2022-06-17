class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @reviews = @user.reviews.all.page(params[:page]).per(5)
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    if user.save
      flash[:notice] = "登録に成功しました"
      redirect_to user_path(user.id)
    else
      flash[:notice] = "登録に失敗しました"
      render :edit
    end
  end

  def confirmation
  end

  def withdrawal
    user = current_user
    user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :is_active, :image, :email)
  end

end

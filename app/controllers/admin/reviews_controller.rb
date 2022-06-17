class Admin::ReviewsController < ApplicationController
before_action :authenticate_admin!
  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_user_reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:user_id)
  end
end

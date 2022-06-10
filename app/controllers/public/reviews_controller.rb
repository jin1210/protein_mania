class Public::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    if item.save
      flash[:notice] = "successfully"
      redirect_to reviews_path
    else
      flash[:notice] = "unsuccessful"
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:ease, :taste, :purpose, :addition)
  end
  
end

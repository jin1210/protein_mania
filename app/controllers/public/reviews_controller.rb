class Public::ReviewsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @reviews = @item.reviews
  end

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @item = Item.find(params[:item_id])
    @review.user_id = current_user.id
    @review.item_id = @item.id
    if @review.save
      flash[:notice] = "successfully"
      redirect_to item_reviews_path(@item.id)
    else
      flash[:notice] = "unsuccessful"
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :item_id, :ease, :taste, :purpose, :addition)
  end

end

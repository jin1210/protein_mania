class Public::ReviewsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @reviews = @item.reviews.all.page(params[:page]).per(4)
  end

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @item = Item.find(params[:item_id])

    if user_signed_in?

      @review.user_id = current_user.id
      @review.item_id = @item.id

      if @review.save
        redirect_to item_reviews_path(@item.id), notice: '投稿に成功しました'
      else
        flash.now.notice = "登録に失敗しました"
        render :new
      end

    else

      redirect_to new_user_session_path, notice: '投稿にはログインが必要です'

    end

  end

  private
  def review_params
    params.require(:review).permit(:user_id, :item_id, :ease, :taste, :purpose, :addition)
  end

end

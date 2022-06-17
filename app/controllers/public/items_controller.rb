class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(5)
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.order("id DESC").limit(3)
  end

end

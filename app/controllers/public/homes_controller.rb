class Public::HomesController < ApplicationController

  def top
    @item = Item.new
  end

  def about
  end

  def search
    @items = Item.search(params)
    @items = @items.page(params[:page])
    render "public/items/index"
  end
end

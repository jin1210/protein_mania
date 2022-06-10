class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "successfully"
      redirect_to admin_item(@item.id)
    else
     flash[:notice] = "unsuccessful"
     render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:notice] = "successfully"
      redirect_to admin_item(@item.id)
    else
      flash[:notice] = "unsuccessful"
      render :edit
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :kcal, :protein, :fat, :carbohydrate, :brand, :flavor, :volume, :type, :price, :image)
  end
  

end

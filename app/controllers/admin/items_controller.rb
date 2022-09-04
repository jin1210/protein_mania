class Admin::ItemsController < ApplicationController
before_action :authenticate_admin!
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save

      redirect_to admin_item_path(@item.id), notice: '登録に成功しました'
    else
      flash.now.notice = "登録に失敗しました"
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

      redirect_to admin_item_path(@item.id), notice: '登録に成功しました'
    else
      flash.now.notice = "登録に失敗しました"
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_path
  end


  private
  def item_params
    params.require(:item).permit(:name, :kcal, :protein, :fat, :carbohydrate, :brand, :flavor, :volume, :protein_type, :price, :image)
  end


end

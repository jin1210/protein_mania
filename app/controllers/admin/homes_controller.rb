class Admin::HomesController < ApplicationController
before_action :authenticate_admin!
  def top
    @items = Item.all.page(params[:page])
  end

end

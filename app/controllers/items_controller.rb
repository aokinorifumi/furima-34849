class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :burden_id, :prefecture_id, :delivery_day_id, :price ).merge(user_id: current_user.id)
  end
end

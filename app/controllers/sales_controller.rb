class SalesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @sale_street = SaleStreet.new
  end

  def create
    @item = Item.find(params[:item_id])
    @sale_street = SaleStreet.new(sale_params)
    if @sale_street.valid?
      @sale_street.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sale_params
    params.require(:sale_street).permit(:postal_cord, :prefecture_id, :area, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end

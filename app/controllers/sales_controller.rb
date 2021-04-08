class SalesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @sale_street = SaleStreet.new
  end

  def create
    @item = Item.find(params[:item_id])
    @sale_street = SaleStreet.new(sale_params)
    if @sale_street.valid?
      pay_item
      @sale_street.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sale_params
    params.require(:sale_street).permit(:postal_cord, :prefecture_id, :area, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
        amount: @item.price,  
        card: sale_params[:token], 
        currency: 'jpy'                
    )
  end


end

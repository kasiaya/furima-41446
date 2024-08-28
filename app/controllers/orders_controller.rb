class OrdersController < ApplicationController
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if @order_delivery_address.valid?
      pay_item
      @order_delivery_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity

    end
  end

  private

  def order_params
    params.require(:order_delivery_address).permit(:postal_code, :delivery_area_id, :city, :street_number, :building_name,
                                                   :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    price = @item.price
    Payjp::Charge.create(
      amount: price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

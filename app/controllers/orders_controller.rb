class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    # binding.pry
    if @order_delivery_address.valid?
      Payjp.api_key = 'sk_test_321bb7c5c5c45cacb06cbfc7' # 自身のPAY.JPテスト秘密鍵を記述しましょう
      price = @item.price
      Payjp::Charge.create(
        amount: price, # 商品の値段
        card: order_params[:token], # カードトークン
        currency: 'jpy' # 通貨の種類（日本円）
      )
      @order_delivery_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity

    end
  end

  private

  def order_params
    params.require(:order_delivery_address).permit(:postal_code, :delivery_area_id, :city, :street_number, :building_name,
                                                   :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end

class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @orders = @item.order
  end

  def create
    # @item = Item.find(params[:item_id])
    # @order = @item.orders.build(order_params)
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :price, :category_id, :condition_id, :delivery_payer_id,
                                 :delivery_area_id, :lead_time_id).merge(user_id: current_user.id)
  end
end

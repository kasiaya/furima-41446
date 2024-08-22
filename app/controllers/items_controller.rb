class ItemsController < ApplicationController
  def index
    # @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
    # redirect_to '/'
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end

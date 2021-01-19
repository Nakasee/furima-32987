class ItemsController < ApplicationController
  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

private

  def item_params
    paramus.require(:item).permit(:name, :price, :description, :category_id, :judgment_id, :cost_id, :prefecture_id, :day_id )
  end
end

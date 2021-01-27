class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  def index
    @item_buyer = ItemBuyer.new
  end
  def create
    @item_buyer = ItemBuyer.new(order_params)
    if @item_buyer.valid?
      @item_buyer.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:item_buyer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :order).merge( item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

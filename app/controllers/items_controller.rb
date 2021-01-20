class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: [, :show, :create]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :category_id, :judgment_id, :cost_id, :prefecture_id,
                                 :day_id).merge(user_id: current_user.id)
  end
end

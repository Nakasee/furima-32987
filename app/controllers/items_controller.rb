class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destory
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :category_id, :judgment_id, :cost_id, :prefecture_id,
                                 :day_id).merge(user_id: current_user.id)
  end
end

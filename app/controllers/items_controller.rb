class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destory
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :category_id, :judgment_id, :cost_id, :prefecture_id,
                                 :day_id).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path(current_user) unless Item.find(params[:id]).user.id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

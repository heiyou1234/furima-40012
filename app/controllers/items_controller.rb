class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items=Item.order("created_at DESC")
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  redirect_to root_path unless current_user.id == @item.user_id
  @item.destroy
  redirect_to root_path
end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :delivery_id, :prefecture_id, :number_of_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

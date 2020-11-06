class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @item = Item.order("created_at DESC")
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
    unless current_user == @item.user
      redirect_to root_path
    end  
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
    end
      redirect_to root_path
  end
  
  def set_item
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :condition_id, :postage_id, :region_id, :shipping_date_id, :description, :image).merge(user_id: current_user.id)
  end
  
end

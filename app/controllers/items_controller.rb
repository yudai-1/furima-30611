class ItemsController < ApplicationController

  def index
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :condition_id, :postage_id, :region_id, :shipping_date_id, :description, :image).merge(user_id: current_user.id)
  end
  
end

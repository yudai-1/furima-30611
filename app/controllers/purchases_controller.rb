class PurchasesController < ApplicationController
  before_action :move_to_signed_in, expect: [:index]

  def index
    @donation = Donation.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @donation = Donation.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @donation.valid?
      pay_item
      @donation.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:post_code, :city, :block_number, :building_name, :phone_number, :prefecture_id, :item_id, :token).merge(user_id: current_user.id)
  end  

  def pay_item
    Payjp.api_key = "sk_test_2a2401fc1547ada97073f251"
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    ) 
  end    

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end

class PurchaseInfoController < ApplicationController

  before_action :set_item, only: [:index, :create,:show]
  before_action :authenticate_user!
  before_action :move_to_root_path, only: [:index, :create]
  before_action :cannot_buy, only: [:index, :create]



  def index
  @combine = Combine.new
  end 

  def create
    @combine = Combine.new(purchase_info_params)
    if @combine.valid?
      pay_item
      @combine.save
      redirect_to root_path
    else
      render :index
    end
  end

  
    

private

  def purchase_info_params
    params.require(:combine).permit(:postcode, :prefecture_id, :city_etc, :place_num, :building_name, :phone_num).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end



  def set_item
    @item = Item.find(params[:item_id])
  end 

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,
          card: purchase_info_params[:token],    
          currency: 'jpy'                
        )
  end   
  
  def move_to_root_path
    if current_user == @item.user
    redirect_to root_path 
    end
  end

  def cannot_buy
  if user_signed_in? && @item.purchase_info 
    redirect_to root_path 
    end
  end

  



end


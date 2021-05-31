class PurchaseInfoController < ApplicationController

  before_action :set_item, only: [:index, :create,:show]

  def index
  @combine = Combine.new
  # @item =  Item.find(params[:item_id])
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

end


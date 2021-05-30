class PurchaseInfoController < ApplicationController

def index
@combine = Combine.new
end 

def create
  @combine = Combine.new(purchase_info_params)
  if @combine.valid?
    @combine.save
    redirect_to root_path
  else
    render :index
  end
end
  

private

def purchase_info_params
  params.require(:combine).permit(:postcode, :prefecture_id, :city_etc, :place_num, :building_name, :phone_num).merge(item_id: params[:item_id], user_id: current_user.id)
end

end


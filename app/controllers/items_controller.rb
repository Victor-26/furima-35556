class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  
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

  def which_pay
    @item = Item.find_by(which_pay_id: params[:id])
    @items = Item.where(which_pay_id: params[:id]).order('created_at DESC')
  end
  

  
  private

  def item_params
    params.require(:item).permit( :image, :name, :explanation, :category_id, :condition_id, :which_pay_id, :prefecture_id, :period_id, :price).merge(user_id: current_user.id)
  end

end

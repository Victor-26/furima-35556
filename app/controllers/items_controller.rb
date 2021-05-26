class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_index, only: [ :edit,:update,:destroy]
  
  def index
    @items = Item.order("created_at DESC") #orderを鵜買う際はallは省略できる
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

  # def show
  #   @item = Item.find(params[:id])
  # end

  # def edit
  #   @item = Item.find(params[:id])
  # end  <before_action :set_item, except: [:index, :new, :create]を記述したため不要になった>
  #＊復習しやすいためにあえてコメントアウトにして残しています

  def update   
    # @item = Item.find(params[:id]) ＊復習しやすいためにあえてコメントアウトにして残しています
    if @item.update(item_params)     
      redirect_to item_path
     else
      render :edit
   end
  end 

  def destroy
    # @item = Item.find(params[:id])＊復習しやすいためにあえてコメントアウトにして残しています
     @item.destroy
     redirect_to root_path
   end  

  




  
  private

  def item_params
    params.require(:item).permit( :image, :name, :explanation, :category_id, :condition_id, :which_pay_id, :prefecture_id, :period_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user == @item.user
  end

end

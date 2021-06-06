class MessagesController < ApplicationController
  
  def create
    @message = Message.create(message_params)
    @user = current_user
    # redirect_to "/items/#{@message.item.id}" 
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message, user:  @user
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

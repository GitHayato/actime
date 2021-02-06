class MessagesController < ApplicationController
  def index
    @message = Message.new
    # 自分の属するルームのみ表示
    @rooms = Room.all
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    message = Message.create(message_params)
    if message.save
      redirect_to room_messages_path(@room.id)
    end
  end

  private

  def message_params
    params.permit(:content).merge(user_id: current_user.id, room_id: @room.id)
  end
end

class MessagesController < ApplicationController
  def index
    # 自分の属するルームのみ表示
    @rooms = Room.all
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user).order(id: "DESC")
  end

  def create
    @room = Room.find(params[:room_id])
    message = Message.create(message_params)
    render json:{ post: message, user: message.user.username }
  end

  def destroy
    room = Room.find(params[:room_id])
    message = Message.find(params[:id])
    if message.user.id == current_user.id
      message.destroy
      redirect_to room_messages_path(room.id)
    else
      render :index
    end
  end

  private

  def message_params
    params.permit(:content).merge(user_id: current_user.id, room_id: @room.id)
  end
end

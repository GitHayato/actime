class MessagesController < ApplicationController
  before_action :set_user, only:[:index, :create, :destroy]
  def index
    current_user_rooms = RoomUser.where(user_id: current_user.id)
    rooms = []
    current_user_rooms.each do |room|
      rooms << room.room_id
    end
    @rooms = Room.where(id: rooms)
    @messages = @room.messages.includes(:user).order(id: "DESC")
  end

  def create
    message = Message.create(message_params)
    render json:{ post: message, user: message.user.username }
  end

  def destroy
    message = Message.find(params[:id])
    if message.user.id == current_user.id
      message.destroy
      redirect_to room_messages_path(@room.public_uid)
    else
      render :index
    end
  end

  private

  def message_params
    params.permit(:content).merge(user_id: current_user.id, room_id: @room.id)
  end

  def set_user
    @room = Room.find_by(public_uid: params[:room_id])
  end
end

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only:[:index, :create, :destroy]
  def index
    room_ids = current_user.rooms.ids
    @rooms = Room.where(id: room_ids)
    @messages = @room.messages.includes(:user).order(id: "DESC")
    
    current_room = Room.find_by(public_uid: params[:room_id])
    current_room_users = current_room.users.ids
    unless current_room_users.include?(current_user.id)
      redirect_to rooms_path
    end
  end

  def create
    message = Message.create(message_params)
    render json:{ post: message, user: message.user }
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

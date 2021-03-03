class RoomsController < ApplicationController
  def index
    # 要調整
    @rooms = Room.all
  end

  def new
    @room = Room.new
    @users = User.where.not(id: current_user.id)
  end

  def create
    @room = Room.create(room_params)
    if @room.save
      redirect_to room_messages_path(@room.id)
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    if room.destroy
      redirect_to rooms_path
    end
  end

  private
  
  def room_params
    params.require(:room).permit(:thread_name, user_ids: [])
  end
end

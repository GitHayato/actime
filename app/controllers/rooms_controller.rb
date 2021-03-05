class RoomsController < ApplicationController
  def index
    current_user_rooms = RoomUser.where(user_id: current_user.id)
    rooms = []
    current_user_rooms.each do |room|
      rooms << room.room_id
    end
    @rooms = Room.where(id: rooms)
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

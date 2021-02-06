class RoomsController < ApplicationController
  def index
    # 要調整
    @rooms = Room.ids
  end

  def new
    @room = Room.new
  end

  def create
    
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_messages_path(@room.id)
    else
      render :new
    end
  end

  private
  
  def room_params
    # permitにユーザー招待枠の許可
    params.require(:room).permit(:thread_name)
  end
end

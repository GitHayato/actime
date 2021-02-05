class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    
    @room = Room.new(room_params)
    if @room.save
      # パスの正しい設定
      redirect_to top_pages_path
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

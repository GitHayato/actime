class RoomsController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :following_user, only: [:new, :edit]

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
  end

  def create
    @room = Room.create(room_params)
    if @room.save
      redirect_to room_messages_path(@room.public_uid)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_messages_path(@room.public_uid)
    else
      render :edit
    end
  end

  def destroy
    room = Room.find_by(public_uid: params[:id])
    if room.destroy
      redirect_to rooms_path
    end
  end

  private
  
  def room_params
    params.require(:room).permit(:thread_name, :public_uid, user_ids: [])
  end

  def set_user
    @room = Room.find_by(public_uid: params[:id])
  end

  def following_user
    followings = User.find(current_user.id).following_ids
    @users = User.where(id: followings)
  end
end

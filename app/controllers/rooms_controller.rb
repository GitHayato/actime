class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new, :edit, :update]
  before_action :following_user, only: [:new, :create, :edit, :update]
  before_action :follower, only: [:new, :edit]

  def new
    @thread = Room.new
    room_ids = current_user.rooms.ids
    @rooms = Room.where(id: room_ids)
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
    @users_in_this_room = @room.users
    @room = Room.find_by(public_uid: params[:id])
    @invite_users = @mutual_follow - @users_in_this_room
  end
  
  def update
    @users_in_this_room = @room.users
    @follow_users = @users.where.not(id: @users_in_this_room.ids)
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

  def follower
    followers = User.find(current_user.id).follower_ids
    follower_users = User.where(id: followers)
    @mutual_follow = @users && follower_users
  end
end

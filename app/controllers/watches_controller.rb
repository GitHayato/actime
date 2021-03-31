class WatchesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_room, only: [:new, :create, :update]

  def new
    @watches = Watch.includes(:user).where(room_id: @room.id).order(id: "DESC").page(params[:page]).per(50)
    @users = User.where(id: @room.user_ids)
    @events = Event.where(room_id: @room.id)
    @distances = Distance.where(room_id: @room.id)

    current_room = Room.find_by(public_uid: params[:room_id])
    current_room_users = current_room.users.ids
    unless current_room_users.include?(current_user.id)
      redirect_to rooms_path
    end
  end

  def create
    watch = Watch.create(watch: watch_params[:watch], room_id: @room.id)
    users = User.where(id: @room.user_ids)
    events = Event.where(room_id: @room.id)
    distances = Distance.where(room_id: @room.id)
    render json:{ watch: watch, users: users, events: events, distances: distances }
  end

  def edit
  end

  def update
    watch = Watch.find(params[:id])
    watch.update(watch_params)
    render json:{ watch: watch }
  end

  private
  
  def watch_params
    params.permit(:watch, :event_id, :distance_id, :user_id, room_id: @room.id)
  end

  def set_room
    @room = Room.find_by(public_uid: params[:room_id])
  end
end
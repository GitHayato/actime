class WatchesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_room, only: [:new, :create, :update]

  def new
    @watches = Watch.includes(:user).where(room_id: @room.id).order(id: "DESC").page(params[:page]).per(50)
    @users = User.where(id: @room.user_ids)
  end

  def create
    watch = Watch.create(watch: watch_params[:watch], room_id: @room.id)
    render json:{ watch: watch }
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
    params.permit(:watch, :event, :distance, :user_id, room_id: @room.id)
  end

  def set_room
    @room = Room.find_by(public_uid: params[:room_id])
  end
end
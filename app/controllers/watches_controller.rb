class WatchesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:new, :create]
  before_action :search_room, only: [:new, :create, :update]

  def index
  end

  def new
    @watches = Watch.where(room_id: search_room.id).order(id: "DESC").page(params[:page]).per(50)
    if @watches
      @watches
    end
    users_in_room = search_room.user_ids
    @users = User.where(id: users_in_room)
  end

  def create
    watch = Watch.create(watch: watch_params[:watch], room_id: search_room.id)
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
    params.permit(:watch, :event, :distance, :user_id, room_id: search_room.id)
  end

  def set_user  
    @room = Room.find_by(public_uid: params[:room_id])
  end
  
  def search_room
    search_room = Room.find_by(public_uid: params[:room_id])
  end
end
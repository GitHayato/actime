class WatchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def new
    @room = Room.find(params[:room_id])
    watches = Watch.where(room_id: params[:room_id]).exists?
    if watches
      @watches = Watch.where(room_id: params[:room_id]).order(id: "DESC").page(params[:page]).per(50)
    end
  end

  def create
    watch = Watch.create(watch_params)
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
    params.permit(:watch, :room_id, :event, :distance)
  end

end
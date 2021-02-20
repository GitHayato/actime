class WatchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def new
    @room = Room.find(params[:room_id])
    @watches = Watch.all.order(id: "DESC")
  end

  def create
    watch = Watch.create(watch_params)
    render json:{ watch: watch }
  end

  private
  
  def watch_params
    params.permit(:watch, :room_id)
  end

end
class WatchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def new
    @watches = Watch.all.order(id: "DESC")
  end

  def create
    watch = Watch.create(watch_params)
    render json:{ watch: watch }
  end

  private
  
  def watch_params
    params.permit(:watch)
  end

end
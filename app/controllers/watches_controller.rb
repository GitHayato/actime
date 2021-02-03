class WatchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def new
    @watches = Watch.all.order(id: "DESC")
  end

  def create
    watch = Watch.create(params[:watch])
    render json:{ watch: watch }
  end

end

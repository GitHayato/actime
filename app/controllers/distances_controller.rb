class DistancesController < ApplicationController
  def create
    @room = Room.find_by(public_uid: params[:room_id])
    distance = Distance.create(distance_params)
    render json:{distance: distance}
  end

  private

  def distance_params
    params.permit(:distance).merge(room_id: @room.id)
  end
end

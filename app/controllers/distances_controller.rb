class DistancesController < ApplicationController
  def create
    @room = Room.find_by(public_uid: params[:room_id])
    distance = Distance.create(distance_params)
    if distance.save
      redirect_to new_room_watch_path(@room.public_uid)
    else
      render :new
    end
  end

  def distance_params
    params.permit(:distance).merge(room_id: @room.id)
  end
end

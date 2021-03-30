class EventsController < ApplicationController
  def create
    @room = Room.find_by(public_uid: params[:room_id])
    event = Event.create(event_params)
    if event.save
      redirect_to new_room_watch_path(@room.public_uid)
    else
      render :new
    end
  end

  private

  def event_params
    params.permit(:event).merge(room_id: @room.id)
  end
end

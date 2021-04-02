class EventsController < ApplicationController
  def create
    @room = Room.find_by(public_uid: params[:room_id])
    event = Event.create(event_params)
    render json:{event: event}
  end

  private

  def event_params
    params.permit(:event).merge(room_id: @room.id)
  end
end

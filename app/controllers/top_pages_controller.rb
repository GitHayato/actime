class TopPagesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user.id
    end
    room_ids = current_user.rooms.ids
    @rooms = Room.where(id: room_ids)
  end
end

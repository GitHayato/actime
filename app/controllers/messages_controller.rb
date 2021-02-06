class MessagesController < ApplicationController
  def index
    @message = Message.new
    # 自分の属するルームのみ表示
    @rooms = Room.all
  end

end

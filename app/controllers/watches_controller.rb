class WatchesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_room, only: [:index, :new, :create, :update]
  before_action :common_data, only: [:index, :new, :create]
  require 'csv'

  def index

  end

  def new
    @watches = Watch.includes(:user).where(room_id: @room.id).order(id: "DESC").page(params[:page]).per(50)
    room_ids = current_user.rooms.ids
    @rooms = Room.where(id: room_ids)
    current_room = Room.find_by(public_uid: params[:room_id])
    @current_room_users = current_room.users
    unless @current_room_users.ids.include?(current_user.id)
      redirect_to rooms_path
    end
    respond_to do |format|
      format.html
      format.csv do |csv|
        export_time_csv(@watches)
      end
    end
  end

  def create
    watch = Watch.create(watch_params)
    if params[:event_id]
      if watch.save
        flash[:notice] = "正常に登録されました"
        redirect_to room_watches_path(@room.public_uid)
      else
        flash[:alert] = "正しい情報を入力して下さい"
        render :index
      end
    else
      render json:{ watch: watch, users: @users, events: @events, distances: @distances }
    end
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
    params.permit(:watch, :event_id, :distance_id, :user_id).merge(room_id: @room.id)
  end

  def set_room
    @room = Room.find_by(public_uid: params[:room_id])
  end

  def common_data
    @users = User.where(id: @room.user_ids)
    @events = Event.where(room_id: @room.id)
    @distances = Distance.where(room_id: @room.id)
  end
  
  def export_time_csv(watches)
    csv_data = CSV.generate do |csv|
      column_names = %w(日付 タイム 名前 種目 距離)
      csv << column_names
      watches.each do |watch|
        if watch.user == nil
          username = ""
        else
          username = watch.user.username
        end
        if watch.event == nil
          event = ""
        else
          event = watch.event.event
        end
        if watch.distance == nil
          distance = ""
        else
          distance = watch.distance.distance
        end
        column_values = [
          watch.created_at.strftime('%Y/%m/%d'),
          watch.watch,
          username,
          event,
          distance
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: "タイム一覧.csv")
  end
end
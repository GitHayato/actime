class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :following, :follower]
  def show
    @following = Relationship.where(user_id: @user.id).count
    @follower = Relationship.where(follow_id: @user.id).count
  end

  def destroy
    if @user.destroy
      redirect_to new_user_registration_path
    else
      render :show
    end
  end

  def following
    followings = User.find(@user.id).following_ids
    @users = User.where(id: followings)
    @comment = "フォロー"
  end

  def follower
    followers = User.find(@user.id).follower_ids
    @users = User.where(id: followers)
    @comment = "フォロワー"
  end

  private

  def set_user
    @user = User.find_by(public_uid: params[:id])
  end
end

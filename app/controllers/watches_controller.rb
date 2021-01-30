class WatchesController < ApplicationController
  def index
  end

  def new
    @watches = Watch.all
  end

  def create
    post = Post.create
    render json:{ post: post }
  end
end

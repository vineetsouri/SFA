class VideosController < ApplicationController
  def index
    if user_signed_in?
      @videos = current_user.videos.all
      @new_video = current_user.videos.new
      render "video"
    end
  end

  def create
    @videos = current_user.videos.all
    @video = current_user.videos.new(video_params)
    @video.save!
    @new_video = current_user.videos.new
    render "video"
  end

private
  def video_params
    params.require(:video).permit(:video_url)
  end
end

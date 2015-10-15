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
    ab = video_params
    a = ab["video_url"].split("watch?v=")
    ab["video_url"] = a[0] + "embed/" + a[1]
    @video = current_user.videos.new(ab)
    @video.save!
    @new_video = current_user.videos.new
    render "video"
  end

private
  def video_params
    params.require(:video).permit(:video_name, :video_url)
  end
end

class VideoController < ApplicationController
  def index
    if user_signed_in?
      render "video"
    end
  end
end

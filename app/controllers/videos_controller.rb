class VideosController < ApplicationController
  RECENTLY_VIEWED_THRESHOLD = 5

  def index
    redirect_to video_url(Video.random)
  end

  def show
    # Current video to show...
    @video = Video.find(params[:id])

    # Find a video that hasn't already been viewed recently...
    add_recently_viewed_video(@video)

    # Now find the next video to show...
    @next_video = Video.random_except(viewed_recently)
  end

  protected

  def viewed_recently
    session[:viewed_recently] ||= []
  end

  def add_recently_viewed_video(video)
    unless viewed_recently.include?(video.id)
      viewed_recently.unshift(video.id)
    end

    # If we're above the threshold, let's get rid of one.
    if viewed_recently.length > RECENTLY_VIEWED_THRESHOLD
      viewed_recently.pop
    end
  end
end

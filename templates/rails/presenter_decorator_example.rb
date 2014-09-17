class HomepageController < ApplicationController
  def index
    @presenter = HomepagePresenter.new(current_user)
  end
end

class HomepagePresenter
  attr_reader :popular_videos, :recommended_videos, :categories
  def initialize(current_user)
    @popular_videos = VideoDecorator.decorate(Videos.order('views DESC').limit(30))
    @recommended_videos = VideoDecorator.decorate(Videos.recommended_for(current_user))
    @categories = Category.all
  end
end

class Video < ActiveRecord::Base
end

class VideoDecorator < ApplicationDecorator
  def thumbnail_url
    h.image_url("vid_thumb_#{model.id}.jpg")
  end
end

- @presenter.popular_videos.each do |video|
  = link_to image_tag(@video.thumbnail_url), video_path(video)

# Presenters should be used if you define more than 1 instance var per view (sandi's ruel 1 ivar per view)
# Therefore you are summing up 3 ivars into 1
# Also use presenters if you have to interact between 2 models

# Decorators should be used if you're model is getting to fat and you have to deal only with 1 model
# instead of shoving all methods u need to use in the view into the model you can define them in decorators
# you are also able to delegate or not :)


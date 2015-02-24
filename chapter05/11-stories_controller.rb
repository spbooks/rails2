class StoriesController < ApplicationController
  def index
    @story = Story.find_by_name('SitePoint Forums')
  end
end
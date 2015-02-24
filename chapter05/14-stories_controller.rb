class StoriesController < ApplicationController
  def index
    @story = Story.find(:first, :order => 'RANDOM()')
  end
end
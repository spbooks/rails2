class StoriesController < ApplicationController
  def index
    @story = Story.find(:first, :order => 'RANDOM()')
  end
  
  def new
    @story = Story.new
  end
end
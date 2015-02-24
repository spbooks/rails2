class StoriesController < ApplicationController
  def index
    @story = Story.find(:first, :order => 'RANDOM()')
  end
  
  def new
    @story = Story.new
  end
  
  def create
    @story = Story.new(params[:story])
    @story.save
    flash[:notice] = 'Story submission succeeded'
    redirect_to stories_path
  end
end
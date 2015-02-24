class StoriesController < ApplicationController
  before_filter :login_required, :only => [ :new, :create ]
  def index
    @story = Story.find(:first, :order => 'RANDOM()')
  end
  
  def new
    @story = Story.new
  end
  
  def create
    @story = Story.new(params[:story])
    if @story.save
      flash[:notice] = 'Story submission succeeded'
      redirect_to stories_path
    else
      render :action => 'new'
    end
  end
    
  def show
    @story = Story.find(params[:id])
  end
  
end
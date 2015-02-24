class TagsController < ApplicationController

  def show
    @stories = Story.find_tagged_with(params[:id])
  end
  
end

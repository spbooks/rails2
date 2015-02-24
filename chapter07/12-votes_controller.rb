class VotesController < ApplicationController

  def create
    @story = Story.find(params[:story_id])
    @story.votes.create
  end
  
end
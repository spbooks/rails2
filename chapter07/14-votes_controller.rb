class VotesController < ApplicationController

  def create
    @story = Story.find(params[:story_id])
    @story.votes.create
    respond_to do |format|
      format.html { redirect_to @story }
      format.js
    end
  end
  
end
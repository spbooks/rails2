class VotesController < ApplicationController
  before_filter :login_required
  def create
    debugger
    @story = Story.find(params[:story_id])
    @story.votes.create(:user => @current_user)
    respond_to do |format|
      format.html { redirect_to @story }
      format.js
    end
  end
end

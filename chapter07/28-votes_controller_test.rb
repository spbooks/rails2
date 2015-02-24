require File.dirname(__FILE__) + '/../test_helper'

class VotesControllerTest < ActionController::TestCase
  
  def test_should_accept_vote
    assert stories(:two).votes.empty?
    post :create, :story_id => stories(:two)
    assert ! assigns(:story).votes.empty?
  end
  
end

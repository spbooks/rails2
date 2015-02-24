require File.dirname(__FILE__) + '/../test_helper'

class VotesControllerTest < ActionController::TestCase
  
  def test_should_accept_vote
    assert stories(:two).votes.empty?
    post :create, :story_id => stories(:two)
    assert ! assigns(:story).votes.empty?
  end
  
  def test_should_render_rjs_after_vote_with_ajax
    xml_http_request :post, :create, :story_id => stories(:two)
    assert_response :success
    assert_template 'create'
  end
  
end

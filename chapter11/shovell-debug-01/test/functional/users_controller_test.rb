require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase

  def test_should_show_user
    get :show, :id => users(:patrick)
    assert_response :success
    assert_template 'show'
    assert_equal users(:patrick), assigns(:user)
  end
  
  def test_should_show_submitted_stories
    get :show, :id => users(:patrick)
    assert_select 'div#stories_submitted div.story', :count => 2
  end
  
  def test_should_show_stories_voted_on
    get :show, :id => users(:patrick)
    assert_select 'div#stories_voted_on div.story', :count => 1
  end
  
end

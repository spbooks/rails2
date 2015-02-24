require File.dirname(__FILE__) + '/../test_helper'

class StoriesControllerTest < ActionController::TestCase
  
  def test_should_show_index
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:story)
  end
  
end
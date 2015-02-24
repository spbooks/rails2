require File.dirname(__FILE__) + '/../test_helper'

class StoriesControllerTest < ActionController::TestCase
  
  def test_should_show_index
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:story)
  end
  
  def test_should_show_new
    get :new
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:story)
  end
  
  def test_should_show_new_form
    get :new
    assert_select 'form p', :count => 3
  end

end
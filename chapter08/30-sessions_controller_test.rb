require File.dirname(__FILE__) + '/../test_helper'

class SessionsControllerTest < ActionController::TestCase

  def test_should_show_login_form
    get :new
    assert_response :success
    assert_template 'new'    
    assert_select 'form p', 4
  end
  
  def test_should_perform_user_login
    post :create, :login => 'patrick', :password => 'sekrit'
    assert_redirected_to stories_path
    assert_equal users(:patrick).id, session[:user_id]
    assert_equal users(:patrick), assigns(:current_user)
  end

  def test_should_fail_user_login
    post :create, :login => 'no such', :password => 'user'
    assert_response :success
    assert_template 'new'
    assert_nil session[:user_id]
  end
  
end

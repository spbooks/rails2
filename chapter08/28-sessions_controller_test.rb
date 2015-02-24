require File.dirname(__FILE__) + '/../test_helper'

class SessionsControllerTest < ActionController::TestCase

  def test_should_show_login_form
    get :new
    assert_response :success
    assert_template 'new'    
    assert_select 'form p', 4
  end
  
end

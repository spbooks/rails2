require File.dirname(__FILE__) + '/../test_helper'

class StoriesControllerTest < ActionController::TestCase
  
  def test_should_show_index
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:stories)
  end
  
  def test_should_show_bin
    get :bin
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:stories)
  end
  
  def test_should_show_new
    get_with_user :new
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:story)
  end
  
  def test_should_show_new_form
    get_with_user :new
    assert_select 'form p', :count => 3
  end
  
  def test_should_add_story
    post_with_user :create, :story => {
      :name => 'test story',
      :link => 'http://www.test.com/'
    }
    assert ! assigns(:story).new_record?
    assert_redirected_to stories_path
    assert_not_nil flash[:notice]
  end
  
  def test_should_reject_missing_story_attribute
    post_with_user :create, :story => { :name => 'story without a link' }
    assert assigns(:story).errors.on(:link)
  end
  
  def test_should_show_story
    get :show, :id => stories(:one)
    assert_response :success
    assert_template 'show'
    assert_equal stories(:one), assigns(:story)
  end
  
  def test_should_show_story_vote_elements
    get :show, :id => stories(:one)
    assert_select 'h2 span#vote_score'
    assert_select 'ul#vote_history li', :count => 2
    assert_select 'div#vote_form form'
  end
  
  def test_should_show_story_submitter
    get :show, :id => stories(:one)
    assert_select 'p.submitted_by span', 'patrick'
  end

  def test_should_indicate_not_logged_in
    get :index
    assert_select 'div#login_logout em', 'Not logged in.'
  end

  def test_should_show_navigation_menu
    get :index
    assert_select 'ul#navigation li', 2
  end
  
  def test_should_indicate_logged_in_user
    get_with_user :index
    assert_equal users(:patrick), assigns(:current_user)
    assert_select 'div#login_logout em a', '(Logout)' 
  end
  
  def test_should_redirect_if_not_logged_in
    get :new
    assert_response :redirect
    assert_redirected_to new_session_path
  end
  
  def test_should_store_user_with_story
    post_with_user :create, :story => {
      :name => 'story with user',
      :link => 'http://www.story-with-user.com/'
    }
    assert_equal users(:patrick), assigns(:story).user
  end
  
end

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
  
  def test_should_add_story
    post :create, :story => {
      :name => 'test story',
      :link => 'http://www.test.com/'
    }
    assert ! assigns(:story).new_record?
    assert_redirected_to stories_path
    assert_not_nil flash[:notice]
  end
  
  def test_should_reject_missing_story_attribute
    post :create, :story => { :name => 'story without a link' }
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
    
end

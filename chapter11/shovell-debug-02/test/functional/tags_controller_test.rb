require File.dirname(__FILE__) + '/../test_helper'

class TagsControllerTest < ActionController::TestCase
  
  def test_should_find_tagged_stories
    stories(:one).tag_list = 'blog, ruby'
    stories(:one).save
    get :show, :id => 'blog'
    assert_equal [ stories(:one) ], assigns(:stories)
  end
  
  def test_should_render_tagged_stories
    stories(:one).tag_list = 'blog, ruby'
    stories(:one).save
    get :show, :id => 'ruby'
    assert_response :success
    assert_template 'show'
    assert_select 'div#content div.story', :count => 1 
  end
  
end

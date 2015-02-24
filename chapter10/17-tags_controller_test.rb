require File.dirname(__FILE__) + '/../test_helper'

class TagsControllerTest < ActionController::TestCase
  def test_should_find_tagged_stories
    stories(:one).tag_list = 'blog, ruby'
    stories(:one).save
    get :show, :id => 'blog'
    assert_equal [ stories(:one) ], assigns(:stories)
  end
end

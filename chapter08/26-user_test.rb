require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase

  def test_should_have_a_stories_association
    assert_equal 2, users(:patrick).stories.size
    assert_equal stories(:one), users(:patrick).stories.first
  end
  
  def test_should_have_a_votes_association
    assert_equal 1, users(:patrick).votes.size
    assert_equal votes(:two), users(:john).votes.first
  end
  
end

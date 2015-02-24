require File.dirname(__FILE__) + '/../test_helper'

class VoteTest < ActiveSupport::TestCase
  
  def test_story_association
    assert_equal stories(:one), votes(:one).story
  end
  
  def test_should_be_associated_with_user
    assert_equal users(:john), votes(:two).user
  end
  
end

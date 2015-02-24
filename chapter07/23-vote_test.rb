require File.dirname(__FILE__) + '/../test_helper'

class VoteTest < ActiveSupport::TestCase
  
  def test_story_association
    assert_equal stories(:one), votes(:one).story
  end
  
end
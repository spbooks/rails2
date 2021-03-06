require File.dirname(__FILE__) + '/../test_helper'

class StoryTest < ActiveSupport::TestCase
  
  def test_should_not_be_valid_without_name
    s = Story.create(:name => nil, :link => 'http://www.testsubmission.com/')
    assert s.errors.on(:name)
  end
  
  def test_should_be_valid_without_link
    s = Story.create(:name => 'My test submission', :link => nil)
    assert s.errors.on(:link)
  end
  
end
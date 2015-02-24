ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class Test::Unit::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
  fixtures :all

  def get_with_user(action, parameters = nil, session = nil, flash = nil)
    get action, parameters, :user_id => users(:patrick).id
  end
  def post_with_user(action, parameters = nil, session = nil, flash = nil)
    post action, parameters, :user_id => users(:patrick).id
  end
end
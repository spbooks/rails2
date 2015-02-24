require "#{File.dirname(__FILE__)}/../test_helper"

class StoriesTest < ActionController::IntegrationTest

  def test_story_submission_with_login
    get '/stories/new'
    debugger
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'sessions/new'
    post '/session', :login => 'patrick', 
        :password => 'sekrit'
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'stories/new'    
    post '/stories', :story => {
      :name => 'Submission from Integration Test',
      :link => 'http://test.com/'
    }
    assert_response :redirect   
    follow_redirect!
    assert_response :success
    assert_template 'stories/index'
  end

end
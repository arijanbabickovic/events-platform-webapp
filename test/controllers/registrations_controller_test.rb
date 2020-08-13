require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end
  
  test "should get new" do
    sign_out users(:one)
    get new_user_registration_url
    assert_response :success
  end
  
  test "should get edit" do
    get edit_user_registration_url(:one)
    assert_response :success
  end
end
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  
  test "should show user" do
    get user_url(@user)
    assert_response :success
  end
  
  test "should update user" do
    patch user_url(@user), params: { user: { first_name: "Arijan" } }
    assert_redirected_to user_url(@user)
  end
end

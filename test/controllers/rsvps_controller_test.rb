require 'test_helper'

class RsvpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:two)
    @event.user = users(:one)
    @event.save!
  end
  
  test "should redirect to login if user logged out" do
    get attend_event_url(@event)
    assert_redirected_to user_session_url
  end
  
  test "should create new rsvp" do
    sign_in users(:one)
    get user_session_url
    assert_difference('Rsvp.count') do
      get attend_event_path(@event)
    end
  end
  
  
  
  
  
  # test "should rsvp to an event" do
  #   get attend_event_url
  #   assert_response :success
  # end

  # test "should create rsvp" do
  #   assert_difference('Rsvp.count') do
  #     post rsvps_url, params: { rsvp: {  } }
  #   end

  #   assert_redirected_to rsvp_url(Rsvp.last)
  # end

  # test "should show rsvp" do
  #   get rsvp_url(@rsvp)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_rsvp_url(@rsvp)
  #   assert_response :success
  # end

  # test "should update rsvp" do
  #   patch rsvp_url(@rsvp), params: { rsvp: {  } }
  #   assert_redirected_to rsvp_url(@rsvp)
  # end

  # test "should destroy rsvp" do
  #   assert_difference('Rsvp.count', -1) do
  #     delete rsvp_url(@rsvp)
  #   end

  #   assert_redirected_to rsvps_url
  # end
end

require 'test_helper'

class RsvpTest < ActiveSupport::TestCase
  
  test "user and event id should be present" do
    @rsvp = Rsvp.new
    assert_not @rsvp.valid?
  end
  
  
  # test "the truth" do
  #   assert true
  # end
end

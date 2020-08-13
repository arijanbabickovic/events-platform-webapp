require 'test_helper'

class RsvpsMailerTest < ActionMailer::TestCase
  include ActiveJob::TestHelper
  
  def setup
    @attendee = users(:two)
    @event = events(:one)
    @event.user = users(:one)
    @event.save!
  end
  
  test 'new rsvp notification email sending' do
    email = RsvpsMailer.user_attended(@event, @attendee)
    assert_emails 1 do
      email.deliver_later
    end
    
    assert_equal email.to, [@event.user.email]
    assert_equal email.from, [ENV["GMAIL_USERNAME"]]
    assert_equal email.subject, "New RSVP to your event"
    assert_match "#{@attendee.first_name} is attending your event.", email.body.encoded
  end
end




# require 'test_helper'

# class NotificationMailerTest < ActionMailer::TestCase

#   def setup
#     @user = users(:one)
#   end

#   test 'welcome' do
#     email = NotificationMailer.welcome(@user)
#     assert_emails 1 do
#       email.deliver_later
#     end

#     assert_equal email.to, [@user.email]
#     assert_equal email.from, ['info@gathuku.tech']
#     assert_equal email.subject, 'Welcome to my App'
#     assert_match 'Thanks for signing', email.body.encoded
#   end
# end
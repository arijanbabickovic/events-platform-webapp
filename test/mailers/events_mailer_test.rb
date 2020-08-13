require 'test_helper'

class EventsMailerTest < ActionMailer::TestCase
  include ActiveJob::TestHelper

  def setup
    @attendee = users(:two)
    @event = events(:one)
    @event.user = users(:one)
    @event.save!
  end

  test "event reminder email sending" do
    email = EventsMailer.reminder(@event, @attendee)
    assert_emails 1 do
      email.deliver_later(wait_until: @event.datetime.to_time - 24.hours)
    end
    assert_equal email.to, [@attendee.email]
    assert_equal email.from, [ENV["GMAIL_USERNAME"]]
    assert_equal email.subject, "Event Reminder"
    assert_match "#{@event.title} is in 24 hours! Get ready!", email.body.encoded
  end


  test "event reminder email job scheduling" do
    email = EventsMailer.reminder(@event, @attendee)
    assert_enqueued_jobs 1 do
      email.deliver_later(wait_until: @event.datetime.to_time - 24.hours)
    end
  end
end
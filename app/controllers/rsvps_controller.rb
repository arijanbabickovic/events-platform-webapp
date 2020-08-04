class RsvpsController < ApplicationController
   before_action :set_event, only: [:attend, :unattend]
   before_action :authenticate_user!
   
   def attend
      rsvp = Rsvp.find_by(event_id: @event.id, user_id: current_user.id)
      rsvp = Rsvp.new(user_id: current_user.id, event_id: @event.id, status: :attending) if rsvp == nil
      rsvp.attending_status!
      rsvp.save
      RsvpMailer.user_attended(@event, current_user).deliver_now
      EventsMailer.reminder(@event, current_user).deliver_later(wait_until: @event.datetime.to_time - 24.hours)
      redirect_to events_path, notice: 'You are attending the event.'
   end
   
   def unattend
      rsvp = Rsvp.find_by(event_id: @event.id, user_id: current_user.id)
      rsvp.status = "not_attending"
      rsvp.save
      redirect_to events_path, notice: 'You are no longer attending this event.'
   end
   
   
   private

    def set_event
      @event = Event.find(params[:id])
    end
end

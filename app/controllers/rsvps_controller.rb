class RsvpsController < ApplicationController
   before_action :set_event, only: [:attend]
   before_action :authenticate_user!
   
   def attend
      rsvp = Rsvp.new(user_id: current_user.id, event_id: @event.id, status: :attending)
      rsvp.save
      redirect_to root_path, notice: 'You are attending the event.'
   end
   
   def unattend
      rsvp = Rsvp.new(user_id: current_user, event_id: @event.id, status: :not_attending)
      rsvp.save
      redirect_to root_path, notice: 'You are no longer attending this event.'
   end
   
   
   private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
    params.require(:event).permit(:title, :description, :datetime, :longitude, :latitude)
    end
end

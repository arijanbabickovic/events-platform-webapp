class RsvpMailer < ApplicationMailer
   
   default from: "eventsplatform2020@gmail.com"
   
   def user_attended(event, attendee)
      user = event.user
      
      mail(to: user.email,
           subject: "New RSVP to your event",
           body: "#{attendee.first_name} is attending your event."
      )
   end
end

class RsvpsMailer < ApplicationMailer
   
   default from: "eventsplatform2020@gmail.com"
   
   def user_attended(event, attendee)
      organiser = event.user
      
      mail(to: organiser.email,
           subject: "New RSVP to your event",
           body: "#{attendee.first_name} is attending your event."
      )
   end
end

class Event < ApplicationRecord
    belongs_to :user
    has_many :rsvps, foreign_key: :event_id, class_name: "Rsvp"
    has_many :attendees, through: :rsvps, source: :user
end
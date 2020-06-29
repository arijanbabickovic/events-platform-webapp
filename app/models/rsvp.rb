class Rsvp < ApplicationRecord
    belongs_to :user
    belongs_to :event
    
    enum status: [:not_attending, :attending], _suffix: true
end

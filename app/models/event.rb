class Event < ApplicationRecord
    belongs_to :user
    has_many :rsvps, foreign_key: :event_id, class_name: "Rsvp"
    has_many :attendees, through: :rsvps, source: :user
    has_one_attached :main_image
    
    validates :title, presence: true, length: {minimum: 6, maximum: 100}
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    validates :datetime, presence: true
    validates :address_first_line, presence: true
    validates :postcode, presence: true
    validates :city, presence: true
        
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    reverse_geocoded_by :latitude, :longitude
    after_validation :reverse_geocode
    
    validate :acceptable_image
    
    attr_accessor :address
    
    
    def address
       [address_first_line, address_second_line, city, postcode].compact.join(", ")
    end
    
    def address_changed?
       address_first_line_changed? || address_second_line_changed? || city_changed? || postcode_changed?
    end
    
    def acceptable_image
        return unless main_image.attached?
    
        unless main_image.byte_size <= 1.megabyte
            errors.add(:main_image, "is too big")
        end
        
        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(main_image.content_type)
            errors.add(:main_image, "must be a JPEG or PNG")
        end
    end
end
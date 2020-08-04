class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :events, dependent: :destroy
  has_many :rsvps, foreign_key: :user_id, class_name: "Rsvp"
  has_many :responses, through: :rsvps, source: :event
  has_one_attached :avatar
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validate :acceptable_image
  
  def name
    [first_name, last_name].compact.join(" ")
  end
  
  def self.change_permission(user_permissions)
    user_permissions.each do |user|
           db_user = User.find(user.first.to_i)
           db_user.update(permissions: user.last)
    end
  end
  
  def acceptable_image
    return unless avatar.attached?

    unless avatar.byte_size <= 1.megabyte
        errors.add(:avatar, "is too big")
    end 
    
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
        errors.add(:avatar, "must be a JPEG or PNG")
    end
  end
end

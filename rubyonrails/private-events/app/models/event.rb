class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attends, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attends

  scope :attended, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }
end

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :concerned_event_id
  has_many :invited_users, through: :attendances
  validates_presence_of :location, :description, :title, :date

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end

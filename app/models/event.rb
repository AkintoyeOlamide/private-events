class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: :concerned_event_id
  has_many :invited_users, through: :attendances
  has_many :invitations, foreign_key: :related_event_id
  has_many :related_users, through: :invitations
  validates_presence_of :location, :description, :title, :date

  # def self.past
  #   self.where("date < ?", Date.today)
  # end
  #
  # def self.upcoming
  #   self.where("date > ?", Date.today)
  # end

  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date >= ?", Date.today) }
end

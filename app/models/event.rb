class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: :concerned_event_id
  has_many :invited_users, through: :attendances
end

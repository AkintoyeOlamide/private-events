class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
  has_many :attendances, foreign_key: :invited_user_id
  has_many :concerned_events, through: :attendances
  has_many :invitations, foreign_key: :related_user_id
  has_many :related_events, through: :invitations
  validates_presence_of :username

end

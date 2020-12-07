class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
  has_many :attendances, foreign_key: :invited_user_id
  has_many :concerned_events, through: :attendances

end

class Attendance < ApplicationRecord
  belongs_to :concerned_event, class_name: "Event"
  belongs_to :invited_user, class_name: "User"
end

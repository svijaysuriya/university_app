class StudentCourse < ApplicationRecord
  validates :user_id, presence: true
  validates :course_id, presence: true

  belongs_to :user
  belongs_to :course
end
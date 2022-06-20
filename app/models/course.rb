class Course < ApplicationRecord
    validates :short_name, presence: true, length: {minimum:3, maximum:10}
    validates :name, presence: true, length: {minimum:5, maximum:50}
    validates :course_instructor, presence: true
    validates :description, presence: true, length: {minimum:5, maximum:200}

    has_many :student_courses
    has_many :users, through: :student_courses
end
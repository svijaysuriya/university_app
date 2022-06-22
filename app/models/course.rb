class Course < ApplicationRecord
    validates :short_name, presence: true, length: {minimum:3, maximum:10}, uniqueness: { case_sensitive: false }
    validates :name, presence: true, length: {minimum:5, maximum:50},uniqueness: { case_sensitive: false }
    validates :course_instructor, presence: true
    validates :max_limit, presence: true
    validates :category, presence: true
    validates :description, presence: true, length: {minimum:5, maximum:200}

    has_many :student_courses
    has_many :users, through: :student_courses
    has_many :questions, dependent: :destroy
end
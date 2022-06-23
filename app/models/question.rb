class Question < ApplicationRecord
  validates :doubt, presence: true, uniqueness: { case_sensitive: false }
  validates :course_id, presence: true
  validates :user_id, presence: true
  has_many :answers , dependent: :delete_all
  belongs_to :user
end
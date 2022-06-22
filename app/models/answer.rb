class Answer < ApplicationRecord
  validates :solution, presence: true, uniqueness: { case_sensitive: false }
  validates :question_id, presence: true
  validates :user_id, presence: true
  belongs_to :question 
  belongs_to :user
end
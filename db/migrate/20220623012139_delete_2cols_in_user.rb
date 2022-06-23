class Delete2colsInUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :question_vote_status
    remove_column :users, :answer_vote_status
  end
end

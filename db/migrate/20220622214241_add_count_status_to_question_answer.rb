class AddCountStatusToQuestionAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :question_vote_status, :integer, default: 0 
    add_column :users, :answer_vote_status, :integer, default: 0
    change_column :questions, :view_count, :integer, default: 0
    change_column :questions, :vote_count, :integer, default: 0
    change_column :answers, :vote_count, :integer, default: 0
  end
end

class AddViewToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :view_count, :integer
    add_column :questions, :vote_count, :integer
    add_column :answers, :vote_count, :integer
  end
end

class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :solution
      t.integer :question_id
    end
  end
end

class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :doubt
      t.integer :course_id
    end
  end
end

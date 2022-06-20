class ChangeStudIdToUserId < ActiveRecord::Migration[5.1]
  def change
    rename_column :student_courses, :student_id, :user_id 
  end
end

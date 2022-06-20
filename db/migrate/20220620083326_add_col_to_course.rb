class AddColToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :course_instructor, :integer 
  end
end

class AddEnrollmentsToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :enrolled_students, :integer, default: 0
  end
end

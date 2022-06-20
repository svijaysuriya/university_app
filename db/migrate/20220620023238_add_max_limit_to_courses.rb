class AddMaxLimitToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :max_limit, :integer, default: 5
  end
end

class AddCategoryToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :category, :string, default: "hardcore"
  end
end

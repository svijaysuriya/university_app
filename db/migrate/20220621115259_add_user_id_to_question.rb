class AddUserIdToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :user_id, :integer
    add_column :answers, :user_id, :integer
    add_column :questions, :created_at, :datetime
    add_column :answers, :created_at, :datetime
    add_column :questions, :updated_at, :datetime
    add_column :answers, :updated_at, :datetime
  end
end

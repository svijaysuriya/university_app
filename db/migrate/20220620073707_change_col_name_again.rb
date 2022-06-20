class ChangeColNameAgain < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :user_type, :ustype
  end
end

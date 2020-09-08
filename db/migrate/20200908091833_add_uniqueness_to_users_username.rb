class AddUniquenessToUsersUsername < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :username, :string, null: false, default: "", unique: true
  end
end

class ChangeColumnRequerimentsToUsers < ActiveRecord::Migration[6.0]
  def change
    #     - t.string :username,              null: false, default: ""
    # - t.string :first_name,              null: false, default: ""
    # - t.string :last_name,              null: false, default: ""
    # - t.text :description,              default: ""
    # - t.string :avatar_url,              null: false, default: ""
    change_column :users, :username, :string, null: false, default: ""
    change_column :users, :first_name, :string, null: false, default: ""
    change_column :users, :last_name, :string, null: false, default: ""
    change_column :users, :description, :text, default: ""
    change_column :users, :avatar_url, :string, null: false, default: ""
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end

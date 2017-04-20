class AddColumnUsernameAndAvatarToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :username, :string, null: false, default: ''
    add_column :users, :avatar, :string, null: false, default: ''
  end

  def down
    remove_column :users, :username
    remove_column :users, :avatar
  end
end

class AddUsersToBurger < ActiveRecord::Migration[5.0]
  def change
    add_column :burgers, :user_id, :integer
  end
end

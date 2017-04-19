class ChangeBurgerColumn < ActiveRecord::Migration[5.0]
  def up
    add_column :burgers, :restaurant_id, :integer
    remove_column :burgers, :restaurant_name
  end

  def down
    add_column :burgers, :restaurant_name, :string
    remove_column :burgers, :restaurant_id
  end
end

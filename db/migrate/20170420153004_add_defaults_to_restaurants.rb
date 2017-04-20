class AddDefaultsToRestaurants < ActiveRecord::Migration[5.0]
  def up
    change_column :restaurants, :dining_type, :string, null: false, default: "Undefined"
    change_column :restaurants, :hours, :string, null: false, default: "Undefined"
  end
  def down
    change_column :restaurants, :dining_type, :string, null: false, default: nil
    change_column :restaurants, :hours, :string, null: false, default: nil
  end
end

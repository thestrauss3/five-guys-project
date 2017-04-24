class GetRidOfUndefinedInRestaurants < ActiveRecord::Migration[5.0]
  def up
    change_column :restaurants, :dining_type, :string, null: true, default: nil
    change_column :restaurants, :hours, :string, null: true, default: nil
  end
  def down
    change_column :restaurants, :dining_type, :string, null: false, default: "undefined"
    change_column :restaurants, :hours, :string, null: false, default: "undefined"
  end
end

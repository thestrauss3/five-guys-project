class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :dining_type, null: false
      t.string :description, null: false
      t.string :hours, null: false

      t.timestamps null: false
    end
  end
end

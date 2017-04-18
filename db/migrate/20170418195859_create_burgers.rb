class CreateBurgers < ActiveRecord::Migration[5.0]
  def change
    create_table :burgers do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :restaurant_name, null: false
      t.string :price
      t.string :image_url

      t.timestamps
    end
  end
end

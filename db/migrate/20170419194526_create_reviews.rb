class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :burger
      t.integer :burger_rating, null: false
      t.text :body, null: false
      t.integer :review_rating, default: 0

      t.timestamps
    end
  end
end

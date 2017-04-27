class CreateUservotes < ActiveRecord::Migration[5.0]
  def change
    create_table :uservotes do |t|
      t.integer :vote, default: 0

      t.belongs_to :review
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end

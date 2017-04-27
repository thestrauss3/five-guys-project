class AddAverageburgerratingColumnToBurgers < ActiveRecord::Migration[5.0]
  def change
    add_column :burgers, :average_rating, :integer, default: 0
  end
end

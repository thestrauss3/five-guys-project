class Burger < ApplicationRecord
  validates :name, :description, :restaurant_name, presence: true
end

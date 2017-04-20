class Burger < ApplicationRecord
  validates :name, :description, presence: true
  
  belongs_to :restaurant
  has_many :reviews
end

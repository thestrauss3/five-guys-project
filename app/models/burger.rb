class Burger < ApplicationRecord
  validates :name, :description, presence: true
  validates :description, length: { minimum: 20 }
  validates :price, numericality: { greater_than: 0 }, allow_nil: true

  belongs_to :restaurant
  belongs_to :user
  has_many :reviews
end

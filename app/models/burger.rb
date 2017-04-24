class Burger < ApplicationRecord
  validates :name, :description, presence: true
  validates :description, length: { minimum: 20 }
  validates :price, numericality: { greater_than: 0 }, allow_nil: true

  belongs_to :restaurant
  belongs_to :user, optional: true
   #had to use optional condition to make tests pass in the
   # scenario where there were already burgers made without burger_rating
   # associated to a user
  has_many :reviews
end

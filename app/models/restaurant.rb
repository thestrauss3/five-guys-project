class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :description, length: {minimum: 20}

  has_many :burgers

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end

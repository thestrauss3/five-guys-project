class Review < ApplicationRecord
  belongs_to :burger
  belongs_to :user, optional: true
  has_many :uservotes

  validates :burger_rating, presence: true, numericality: true, inclusion: { in: 1..5, message: "must be between 1 - 5" }
  validates :body, presence: true, length: {minimum: 20, message: "of review must be 20 characters"}

  def total_vote_count
    total_votes = 0
    self.uservotes.each do |uservote|
      total_votes += uservote.vote
    end
    total_votes
  end
end

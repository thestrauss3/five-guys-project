class StaticPagesController < ApplicationController
  def index
    burgers=Burger.all
      burgers.each do |burger|
      total_burger_score = 0.0
      total_review_size = burger.reviews.size

      burger.reviews.each do |review|
        total_burger_score += review.burger_rating
      end
      average_review_score = total_burger_score / total_review_size
      burger.update_attributes(average_rating: average_review_score)
    end
    highest_rated_burgers = burgers.order(average_rating: :desc)
    if burgers.size >= 6
      @top_three_burgers = highest_rated_burgers[0..2]
      remaining_burgers = highest_rated_burgers[3..-1]
      @random_burgers = remaining_burgers.shuffle[0..2]
    else
      restaurant=FactoryGirl.create(:restaurant)
      test_burger=FactoryGirl.create(:burger, restaurant: restaurant)
      @top_three_burgers = [test_burger, test_burger, test_burger]
      @random_burgers = [test_burger, test_burger, test_burger]
    end
  end
end

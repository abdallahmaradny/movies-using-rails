
class Movie < ApplicationRecord
    has_many :reviews
    
    def average_rating
      reviews.average(:stars).to_f
    end
  end
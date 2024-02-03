class MoviesController < ApplicationController
    def index
      @movies = Movie.includes(:reviews)
                     .group(:id)
                     .order(average_rating: :desc)
    end
  
  end
  
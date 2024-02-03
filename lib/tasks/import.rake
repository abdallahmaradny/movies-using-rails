namespace :import do
    desc "Import movies and reviews from CSV"
    task :movies_and_reviews => :environment do
      require 'csv'
  
      # Import movies
      CSV.foreach('movies.csv', headers: true) do |row|
        Movie.create(title: row['Movie'], description: row['Description'], year: row['Year'], director: row['Director'], filming_location: row['Filming location'], country: row['Country'])
      end
  
      # Import reviews
      CSV.foreach('reviews.csv', headers: true) do |row|
        movie = Movie.find_by(title: row['Movie'])
        Review.create(movie: movie, user: row['User'], stars: row['Stars'], review: row['Review'])
      end
    end
  end
  
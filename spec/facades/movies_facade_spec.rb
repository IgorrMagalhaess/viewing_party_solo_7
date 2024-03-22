require 'rails_helper'

RSpec.describe MoviesFacade do
   describe '#initialize' do
      it 'creates a MoviesFacade object', :vcr do
         facade = MoviesFacade.new("Star Wars")

         expect(facade).to be_a MoviesFacade
      end
   end

   describe '#movies' do
      it 'creates a Movies object', :vcr do
         facade = MoviesFacade.new("Star Wars")
         movies = facade.movies
         movie = movies.first

         expect(movie).to be_a Movie
         expect(movie.title).to be_a String
         expect(movie.review_count).to be_a Integer
         expect(movie.avg_rating).to be_a Float
         expect(movies).to be_a Array
      end
   end

   describe '#movie_by_id' do
      it 'creates a Movie Object', :vcr do
         facade = MoviesFacade.new(550)
         movie = facade.movie_by_id

         expect(movie).to be_a Movie
         expect(movie.title).to be_a String
         expect(movie.review_count).to be_a Integer
         expect(movie.avg_rating).to be_a Float
         expect(movie.runtime).to be_a Integer
         expect(movie.genre).to be_a Array
         expect(movie.cast).to be_a Array
         expect(movie.reviews).to be_a Hash
         expect(movie.release_date).to be_a String
      end
   end

   describe "#cast_by_movie_id" do
      it 'returns the cast for a given movie', :vcr do
         facade = MoviesFacade.new(550)
         movie = facade.movie_by_id
         cast = facade.cast_by_movie_id

         expect(cast).to be_a Array
         expect(cast.size).to eq 10
         expect(cast[0]).to be_a String
         expect(cast[-1]).to be_a String
      end
   end

   describe "#review_by_movie_id" do
      it 'returns the reviews for a given movie', :vcr do
         facade = MoviesFacade.new(550)
         movie = facade.movie_by_id
         reviews = facade.reviews_by_movie_id

         expect(reviews).to be_a Hash
         expect(reviews.first).to be_a Array
         expect(reviews.first[0]).to be_a String
         expect(reviews.first[1]).to be_a String
      end
   end

   describe '#convert_min_to_hours' do
      it 'returns the runtime in hours', :vcr do
         facade = MoviesFacade.new(550)
         movie = facade.movie_by_id

         expect(movie.runtime).to eq(139)

         expect(facade.convert_min_to_hours(movie.runtime)).to eq("2 hours, 19 minutes")
      end
   end

   describe '#where_to_watch' do
      it 'returns the places where I can buy or rent the movie', :vcr do
         facade = MoviesFacade.new(550)
         movie = facade.movie_by_id
         watch_movies = facade.where_to_watch

         expect(watch_movies).to be_a(Array)
         expect(watch_movies[0]).to be_a(Array)
         expect(watch_movies[1]).to be_a(Array)
         expect(watch_movies[0][0]).to be_a(Hash)
         expect(watch_movies[1][0]).to be_a(Hash)
         expect(watch_movies[0][0]).to have_key(:logo_path)
         expect(watch_movies[0][0]).to have_key(:provider_name)
      end
   end

   describe "#similar_movies" do
      it 'returns similar movies to the current movie', :vcr do
         facade = MoviesFacade.new(550)
         movie = facade.movie_by_id
         similar_movies = facade.similar_movies

         expect(similar_movies).to be_a(Array)
         expect(similar_movies.first).to be_a(Movie)
         expect(similar_movies.last).to be_a(Movie)
      end
   end
end
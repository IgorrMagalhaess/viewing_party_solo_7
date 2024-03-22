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


      end
   end
end
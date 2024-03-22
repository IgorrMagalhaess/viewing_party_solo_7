class SimilarController < ApplicationController
   before_action :set_movie, only: [:index]

   def index
      @facade = MoviesFacade.new(params[:movie_id])
      @similar_movies = @facade.similar_movies
   end

   private

   def set_movie
      facade = MoviesFacade.new(params[:movie_id])
      @movie = facade.movie_by_id
   end
end
class SimilarController < ApplicationController
   before_action :set_movie_and_user, only: [:index]

   def index
      @facade = MoviesFacade.new(params[:movie_id])
      @similar_movies = @facade.similar_movies
   end

   private

   def set_movie_and_user
      @user = User.find(params[:user_id])
      facade = MoviesFacade.new(params[:movie_id])
      @movie = facade.movie_by_id
   end
end
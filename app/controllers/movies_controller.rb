class MoviesController < ApplicationController
   before_action :set_user, only: [:index]
   def index
      key = Rails.application.credentials.tmdb[:key]
      conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
         faraday.headers["Authorization"] = "Bearer #{key}"
      end

      response = conn.get("/discover/movie?sort_by=popularity.desc")
      
      data = JSON.parse(response.body, symbolize_names: true)

      @movies = data[:results].map do |movie_data|
         Movie.new(movie_data)
      end
   end

   private

   def set_user
      @user = User.find(params[:user_id])
   end
end
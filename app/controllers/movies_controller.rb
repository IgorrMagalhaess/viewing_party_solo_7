class MoviesController < ApplicationController
   before_action :set_user, only: [:index]
   def index
      key = Rails.application.credentials.tmdb[:bearer_key]
      conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
         faraday.headers["Authorization"] = "Bearer #{key}"
      end
      
      response = conn.get("https://api.themoviedb.org/3/movie/top_rated")
      
      data = JSON.parse(response.body, symbolize_names: true)

      @movies = data[:results].map do |movie_data|
         require 'pry' ; binding.pry
      end
   end

   private

   def set_user
      @user = User.find(params[:user_id])
   end
end
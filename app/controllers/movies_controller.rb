class MoviesController < ApplicationController
   def index
      key = Rails.application.credentials.tmdb[:key]
      conn = Faraday.new(url: "https://api.themoviedb.org/3?api_key=#{key}")
      response = conn.get("movie/top_rated")
      require 'pry' ; binding.pry
      end
   end
end
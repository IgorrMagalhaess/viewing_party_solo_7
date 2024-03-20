class MoviesService
   def conn
      key = Rails.application.credentials.tmdb[:bearer_key]
      conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
         faraday.headers["Authorization"] = "Bearer #{key}"
      end
   end

   def get_url(url)
      response = conn.get(url)

      JSON.parse(response.body, symbolize_names: true)
   end

   def get_top_rated_movies
      get_url("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")
   end
   
      
   #    response = conn.get("https://api.themoviedb.org/3/movie/top_rated")
      
   #    data = JSON.parse(response.body, symbolize_names: true)

   #    @movies = data[:results].map do |movie_data|
   #       require 'pry' ; binding.pry
   #    end

   def get_movies_by_title(title)
      get_url("https://api.themoviedb.org/3/discover/movie?with_keywords=#{title}")
   end
end
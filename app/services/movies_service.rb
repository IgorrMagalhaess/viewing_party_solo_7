class MoviesService
   def conn
      key = Rails.application.credentials.tmdb[:bearer_key]
      conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
         faraday.headers["Authorization"] = "Bearer #{key}"
         faraday.headers['User-Agent'] = 'Faraday v2.9.0'
         faraday.headers['Accept'] = 'application/json'
      end
   end

   def get_url(url)
      response = conn.get(url)

      JSON.parse(response.body, symbolize_names: true)
   end

   def get_top_rated_movies
      get_url("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")
   end

   def get_movies_by_title(title)
      get_url("https://api.themoviedb.org/3/search/movie?query=#{title}")
   end
end
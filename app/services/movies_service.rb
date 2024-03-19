# class MoviesService
#    def get_movies(title)
#       get_url("https://api.themoviedb.org/3/discover/movie?with_keywords=#{title}")
#    end

#    def get_url(url)
#       response = conn.get(url)
#       JSON.parse(response.body, symbolize_names: true)
#    end

#    def conn
#       key = Rails.application.credentials.tmdb[:key]
#       Faraday.new(url: "https://api.themoviedb.org/3?api_key=#{key}")
#    end
# end
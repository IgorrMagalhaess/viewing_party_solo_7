class MoviesFacade
   attr_reader :params
   
   def initialize(params)
      @params = params
   end

   def movies
      service = MoviesService.new
      if @params.nil?
         json = service.get_top_rated_movies
      else
         json = service.get_movies_by_title(@params)
      end

      @movies = json[:results].map do |movie_data|
         Movie.new(movie_data)
      end
   end

   def movie_by_id
      service = MoviesService.new
      movie_json = service.get_movie_by_id(@params)
      @movie = Movie.new(movie_json)
   end

   def cast_by_movie_id
      service = MoviesService.new
      movie_cast_json = service.get_movie_cast_by_id(@params)

      cast = movie_cast_json[:cast].map do |movie_cast|
         movie_cast[:name]
      end
      @movie.cast = cast.take(10)
      @movie_cast = @movie.cast
   end

   def reviews_by_movie_id
      service = MoviesService.new
      reviews_json = service.get_movie_reviews_by_id(@params)

      reviews = Hash.new()
      reviews_json[:results].map do |review|
         reviews[review[:author]] = review[:content]
      end
      
      @movie.reviews = reviews.take(10)
      @movie_reviews = @movie.reviews
   end

   def convert_min_to_hours(min)
      hours = min / 60
      min = min % 60
      "#{hours} hours, #{min} minutes"
   end

   def where_to_watch
      service = MoviesService.new
      where_to_watch_json = service.get_where_to_watch(@params)

      buy = where_to_watch_json[:results][:US][:buy]
      rent = where_to_watch_json[:results][:US][:rent]

      @watch = [buy, rent]
   end
end
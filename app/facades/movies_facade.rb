class MoviesFacade
   def initialize(params, service = MoviesService.new)
      @params = params
      @service = service
      @movies = nil
      @movie = nil
      @movie_cast = nil
      @movie_reviews = nil
      @watch = nil
      @similar = nil
   end

   def movies
      @movies ||= begin
         json = @params.nil? ? @service.get_top_rated_movies : @service.get_movies_by_title(@params)
         @movies = json[:results].map { |movie_data| Movie.new(movie_data) }
      end
   end

   def movie_by_id
      @movie ||= begin
         movie_json = @service.get_movie_by_id(@params)
         @movie = Movie.new(movie_json)
      end
   end

   def cast_by_movie_id
      @movie_cast ||= begin
         movie_cast_json = @service.get_movie_cast_by_id(@params)
         cast = movie_cast_json[:cast].map { |movie_cast| movie_cast[:name] }.take(10)
         @movie.cast = cast
         cast
      end
   end

   def reviews_by_movie_id
      @movie_reviews ||= begin
         reviews_json = @service.get_movie_reviews_by_id(@params)
         reviews = Hash.new()
         reviews_json[:results].map { |review| reviews[review[:author]] = review[:content] }.take(10)
         @movie.reviews = reviews
         reviews
      end
   end

   def convert_min_to_hours(min)
      hours = min / 60
      min = min % 60
      "#{hours} hours, #{min} minutes"
   end

   def where_to_watch
      @watch ||= begin
         where_to_watch_json = @service.get_where_to_watch(@params)
         buy = where_to_watch_json[:results][:US][:buy]
         rent = where_to_watch_json[:results][:US][:rent]
         [buy, rent]
      end
   end

   def similar_movies
      @similar ||= begin
         similar_movies_json = @service.get_similar_movies(@params)
         similar_movies_json[:results].map { |movie_data| Movie.new(movie_data) }
      end
   end

   private

   def params
      @params 
   end
end
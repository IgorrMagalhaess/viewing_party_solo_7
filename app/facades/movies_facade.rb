class MoviesFacade
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
      j
      @movies = json[:results].map do |movie_data|
         Movie.new(movie_data)
      end
   end
end
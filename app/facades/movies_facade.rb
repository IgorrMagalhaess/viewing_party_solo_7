class MoviesFacade
   def initialize(title)
      @title = title
   end

   def movies
      service = MoviesService.new
      require 'pry' ; binding.pry
      json = service.get_movies(@title)
      @movies = json[:results].map do |movie_data|
         Movie.new(movie_data)
      end
   end
end
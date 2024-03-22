class Movie
   attr_reader :title,
               :id,
               :avg_rating,
               :runtime,
               :genre,
               :overview,
               :review_count,
               :poster_path,
               :release_date

   attr_accessor :cast, :reviews
                  
   
   def initialize(attributes)
      @id = attributes[:id]
      @title = attributes[:title]
      @avg_rating = attributes[:vote_average]
      @runtime = attributes[:runtime] # Parsed in minutes, transform to hours
      @genre = attributes[:genres] # array of hashes
      @overview = attributes[:overview]
      @cast = [] # movie credits endpoint
      @review_count = attributes[:vote_count]
      @reviews = {} # movie reviews endpoint
      @poster_path = attributes[:poster_path]
      @release_date = attributes[:release_date]
   end
end
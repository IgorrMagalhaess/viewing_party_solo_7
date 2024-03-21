class Movie
   attr_reader :title,
               :id,
               :avg_rating,
               :runtime,
               :genre,
               :description,
               :review_count

   attr_accessor :cast, :reviews
                  
   
   def initialize(attributes)
      @id = attributes[:id]
      @title = attributes[:title]
      @avg_rating = attributes[:vote_average]
      @runtime = attributes[:runtime] # Parsed in minutes, transform to hours
      @genre = attributes[:genres] # array of hashes
      @description = attributes[:overview]
      @cast = [] # movie credits endpoint
      @review_count = attributes[:vote_count]
      @reviews = [] # movie reviews endpoint
   end
end
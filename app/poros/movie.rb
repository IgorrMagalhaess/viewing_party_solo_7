class Movie
   attr_reader :title,
               :id,
               :avg_rating,
               :runtime,
               :genre,
               :description,
               :cast_members,
               :review_count,
               :review
   
   def initialize(attributes)
      @id = attributes[:id]
      @title = attributes[:title]
      @avg_rating = attributes[:vote_average]
      @runtime = attributes[:runtime] # Parsed in minutes, transform to hours
      @genre = attributes[:genres] # array of hashes
      @description = attributes[:overview]
      @cast_members = attributes[:cast_members] # movie credits endpoint
      @review_count = attributes[:vote_count]
      @review = attributes[:reviews] # movie reviews endpoint
   end
end
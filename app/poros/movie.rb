class Movie
   attr_reader :title,
               :avg_rating,
               :runtime,
               :genre,
               :description,
               :cast_members,
               :review_count,
               :review
   
   def initialize(attributes)
      @title = attributes[:title]
      @avg_rating = attributes[:vote_average]
      @runtime = attributes[:title]
   end
end
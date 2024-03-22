class UsersController < ApplicationController

   def new
      @user = User.new
   end

   def show
      @user = User.find(params[:id])
      @invited_to_viewing_parties = @user.invited_to_viewing_parties
      @hosting_viewing_parties = @user.hosting_viewing_parties ||= []
      
      @invited_movies_facade = initialize_movies_facade(@invited_to_viewing_parties)
      @hosting_movies_facade = initialize_movies_facade(@hosting_viewing_parties)
   end

   def create
      user = User.new(user_params)
      if user.save
         flash[:success] = 'Successfully Created New User'
         redirect_to user_path(user)
      else
         flash[:error] = "#{error_message(user.errors)}"
         redirect_to register_user_path
      end   
   end




private

   def user_params
      params.require(:user).permit(:name, :email)
   end

   def initialize_movies_facade(parties)
      movies_facades = []
      parties.each do |party|
         movie_facade = MoviesFacade.new(party.movie_id)
         movies_facades << movie_facade
      end
      movies_facades
   end
end
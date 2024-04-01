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
      if params[:user][:password] == params[:user][:password_confirmation]
         new_user = User.new(user_params)
         if new_user.save
            session[:user_id] = new_user.id
            flash[:success] = "Welcome, #{new_user.name}"
            redirect_to user_path(new_user)
         else
            flash[:error] = "#{error_message(new_user.errors)}"
            redirect_to register_user_path
         end
      else
         flash[:error] = "Passwords don't match"
         redirect_to register_user_path
      end
   end

   def login_form  
   end

   def login
      user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
         flash[:success] = "Welcome, #{user.name}"
         redirect_to root_path
      else
         flash[:error] = "Sorry, your credentials are invalid"
         render :login_form
      end
   end

private

   def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
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
class MoviesController < ApplicationController
   before_action :set_user, only: [:index]
   def index
      @facade = MoviesFacade.new(params[:search])
   end

   private

   def set_user
      @user = User.find(params[:user_id])
   end
end
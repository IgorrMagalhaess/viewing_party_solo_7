class MoviesController < ApplicationController
   before_action :set_user, only: [:index, :show]
   
   def index
      @facade = MoviesFacade.new(params[:search])
   end

   def show
      @facade = MoviesFacade.new(params[:id])
   end

   private

   def set_user
      @user = User.find(params[:user_id])
   end
end
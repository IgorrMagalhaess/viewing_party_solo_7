class ViewingPartyController < ApplicationController
   before_action :set_user_and_movie, only: [:new, :create, :show]

   def new
   end

   def create
      @viewing_party = ViewingParty.new(viewing_party_params)
      if @viewing_party.save && duration_valid?
         save_host(@user.id, @viewing_party.id)
         save_guests(params, @viewing_party.id)

         redirect_to user_path(@user)
         flash.notice = "Viewing party created successfully."
      else
         redirect_to new_user_movie_viewing_party_path(@user, @movie.id)
         flash.notice = "All fields must be completed. Duration cannot be lower than #{@movie.runtime} minutes."
      end
   end

   def show
      @facade = MoviesFacade.new(params[:movie_id])
      @watch = @facade.where_to_watch
   end

   private
   
   def set_user_and_movie
      @user = User.find_by(id: params[:user_id])
      facade = MoviesFacade.new(params[:movie_id])
      @movie = facade.movie_by_id
   end

   def viewing_party_params
      {
         duration: params[:duration],
         date: build_date(params),
         start_time: build_start_time(params),
      }.merge(
         params.permit(:duration, :date, :start_time, :movie_id)
      )
   end

   def duration_valid?
      facade = MoviesFacade.new(params[:movie_id])
      @viewing_party.duration >= facade.movie_by_id.runtime
   end

   def save_guests(params, viewing_party)
      guests_emails = [params[:guest1], params[:guest2], params[:guest3]]
      guests_emails.each do |guest|
         if guest.present?
            user = User.find_by(email: guest)
            UserParty.create!(user_id: user.id, viewing_party_id: viewing_party, host: false)
         end
      end
   end

   def save_host(user, viewing_party)
      host_party = UserParty.create!(user_id: user, viewing_party_id: viewing_party, host: true)
   end

   def build_date(params)
      "#{params['[date(1i)]']}-#{params['[date(2i)]']}-#{params['[date(3i)]']}"
   end

   def build_start_time(params)
      "#{params['[start_time(4i)]']}:#{params['[start_time(5i)]']}"
   end
end
class UserController < ApplicationController
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if Helpers.is_logged_in?(session)
      @shows = @user.shows
      #binding.pry
      erb :'users/show'
    else
      "Not Logged In"
    end
  end
end

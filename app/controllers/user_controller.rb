class UserController < ApplicationController
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @shows = @user.shows
    if @user.id == session[:id]
      erb :'users/show_logged_in'
    else
      erb :'users/show'
    end
  end
end

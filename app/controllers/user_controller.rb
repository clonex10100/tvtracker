class UserController < ApplicationController
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @shows = @user.shows
    @acc = @user.id == session[:id]
    erb :'users/show'
  end
end

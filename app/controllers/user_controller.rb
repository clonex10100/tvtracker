class UserController < ApplicationController
  get '/users/:slug' do
    @user = User.find(params[:slug])
    erb :'users/show'
  end
end

class AccountController < ApplicationController
  get '/success' do
    erb :'account/success'
  end

  get '/signup' do
    if Helpers.is_logged_in?(session)
      flash[:message] = "You're already logged in"
      redirect '/'
    end
    erb :'account/signup'
  end

  post '/signup' do
    if !User.find_by(name: params[:user][:name])
      @user = User.create(params[:user])
      session[:id] = @user.id
      redirect '/'
    else
      flash[:message] = "Username Taken"
      redirect '/signup'
    end
  end

  get '/login' do
    if Helpers.is_logged_in?(session)
      flash[:message] = "You're already logged in"
      redirect '/'
    end
    erb :'account/login'
  end

  post '/login' do
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:id] = user.id
      redirect "/"
    else
      flash[:message] = "Username or password not correct"
      redirect "/login"
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end

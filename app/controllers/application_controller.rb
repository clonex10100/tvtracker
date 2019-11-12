require 'rack-flash'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash

  configure do 
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    @id = session[:id]
    erb :index
  end

  get '/success' do
    erb :success
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.create(params[:user])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  end

  get '/login' do 
    erb :login
  end
  post '/login' do
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/success"
    else
      flash[:message] = "Username or password not correct"
      redirect "/login"
    end
  end

  post '/logout' do
    session.clear
    redirect '/'
  end
end

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
    if Helpers.is_logged_in?(session)
      @id = session[:id]
      @user = Helpers.current_user(session)
      erb :index_logged_in
    else
      erb :index
    end
  end

  get '/account' do
    unless Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
    redirect "/users/#{Helpers.current_user(session).slug}"
  end
end

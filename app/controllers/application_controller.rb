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
      erb :index
    else
      "<a href=\"/login\"><h1>Please Login</h1></a>"
    end
  end
end

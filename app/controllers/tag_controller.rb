class TagController < ApplicationController
  get '/tags/new' do
    @shows = Helpers.current_user(session).shows
    erb :'tags/new'
  end

  post '/tags' do
    @tag = Tag.create(params[:tag])
    redirect '/'
  end
end

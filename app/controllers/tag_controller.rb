class TagController < ApplicationController
  get '/tags/new' do
    unless Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
    @shows = Helpers.current_user(session).shows
    erb :'tags/new'
  end

  post '/tags' do
    @tag = Tag.create(params[:tag])
    @tag.user = Helpers.current_user(session)
    redirect '/'
  end

  get '/tags' do
    unless Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
    @tags = Helpers.current_user(session).tags
    erb :'tags/index'
  end

  get '/tags/:id' do
    @tag = Tag.find(params[:id])
    if @tag.user.id == session[:id]
      @shows = @tag.shows
      erb :'tags/show'
    else
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
  end

  get '/tags/:id/edit' do
    @tag = Tag.find(params[:id])
    if @tag.user.id == session[:id]
      @shows = Helpers.current_user(session).shows
      erb :'tags/edit'
    else
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
  end

  patch '/tags/:id' do
    @tag = Tag.find(params[:id])
    @tag.update(params[:tag])
    if !params[:tag][:show_ids]
      @tag.shows.clear
      @tag.save
    end
    redirect '/tags'
  end
end

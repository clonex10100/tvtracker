class TagController < ApplicationController
  #add a tag
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
    @tag.save
    redirect '/'
  end

  #Edit a tag
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

  #Delete a tag
  get '/tags/:id/delete' do
    tag = Tag.find(params[:id])
    if tag.user.id == session[:id]
      tag.delete
    end
    redirect '/tags'
  end

  #Display all of the current users tags
  get '/tags' do
    unless Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
    @tags = Helpers.current_user(session).tags
    erb :'tags/index'
  end

  #Display a tag and all of it's shows
  get '/tags/:id' do
    @tag = Tag.find(params[:id])
    @shows = @tag.shows
    @acc = @tag.user.id == session[:id]
    erb :'tags/show'
  end
end

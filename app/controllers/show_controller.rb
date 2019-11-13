class ShowController < ApplicationController
  get '/shows/new' do
    unless Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
    @tags = Helpers.current_user(session).tags
    erb :'shows/new'
  end

  post '/shows' do
    if params[:show][:episodes_watched] > params[:show][:episodes]
      flash[:message] = "Episodes watched cannot be greater than total episodes"
      redirect '/shows/new'
    end
    @show = Show.create(params[:show])
    @show.user = Helpers.current_user(session)
    unless params[:tag][:name].empty?
      tag = Tag.create(params[:tag])
      @show.tags << tag
    end
    @show.save
    redirect "/users/#{Helpers.current_user(session).slug}"
  end

  get '/shows/:id/edit' do
    @show = Show.find(params[:id])
    if @show.user.id == session[:id]
      @tags = Helpers.current_user(session).tags
      erb :'shows/edit'
    else
      flash[:message] = "You may only look at shows owned by you"
      redirect '/'
    end
  end

  patch '/shows/:id' do
    @show = Show.find(params[:id])
    @show.update(params[:show])
    if !params[:show][:tag_ids]
      @show.tags.clear
      @show.save
    end
    unless params[:tag][:name].empty?
      tag = Tag.create(params[:tag])
      @show.tags << tag
      @show.save
    end
    redirect "/account"
  end
end

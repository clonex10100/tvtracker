class ShowController < ApplicationController
  #Add new show
  get '/shows/new' do
    unless Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
    @tags = Helpers.current_user(session).tags
    @categories = Helpers.current_user(session).categories
    erb :'shows/new'
  end

  post '/shows' do
    @show = Show.create(params[:show])
    @show.user = Helpers.current_user(session)
    unless params[:tag][:name].empty?
      tag = Tag.create(params[:tag])
      tag.user = Helpers.current_user(session)
      tag.save
      @show.tags << tag
    end
    unless params[:category][:name].empty?
      category = Category.create(params[:category])
      category.user = Helpers.current_user(session)
      category.save
      @show.category = category
    end
    @show.save
    redirect "/users/#{Helpers.current_user(session).slug}"
  end

  #Edit a show
  get '/shows/:id/edit' do
    @show = Show.find(params[:id])
    if @show.user.id == session[:id]
      @tags = Helpers.current_user(session).tags
      @categories = Helpers.current_user(session).categories
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
      tag.user = Helpers.current_user(session)
      tag.save
      @show.tags << tag
      @show.save
    end
    unless params[:category][:name].empty?
      category = Category.create(params[:category])
      category.user = Helpers.current_user(session)
      category.save
      @show.category = category
      @show.save
    end
    redirect "/account"
  end

  #Delete a show
  get '/shows/:id/delete' do
    show = Show.find(params[:id])
    if show.user.id == session[:id]
      show.delete
    end
    redirect '/'
  end
end

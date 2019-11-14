class CategoryController < ApplicationController
  #Add A new Catagory
  get '/categories/new' do
    unless Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
    @shows = Helpers.current_user(session).shows
    erb :'categories/new'
  end

  post '/categories' do
    @category = Category.create(params[:category])
    @category.user = Helpers.current_user(session)
    @category.save
    redirect '/'
  end

  #Edit a category
  get '/categories/:id/edit' do
    @category = Category.find(params[:id])
    if @category.user.id == session[:id]
      @shows = Helpers.current_user(session).shows
      erb :'categories/edit'
    else
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
  end

  patch '/categories/:id' do
    @category = Category.find(params[:id])
    @category.update(params[:category])
    if !params[:category][:show_ids]
      @category.shows.clear
      @category.save
    end
    redirect '/categories'
  end

  #delete a category
  get '/categories/:id/delete' do
    category = Category.find(params[:id])
    if category.user.id == session[:id]
      category.delete
    end
    redirect '/categories'
  end


  #View users categories
  get '/categories' do
    unless Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to access this page"
      redirect "/login"
    end
    @categories = Helpers.current_user(session).categories
    erb :'categories/index'
  end

  #View a category
  get '/categories/:id' do
    @category = Category.find(params[:id])
    @shows = @category.shows
    @acc = @category.user.id == session[:id]
    erb :'categories/show'
  end

end

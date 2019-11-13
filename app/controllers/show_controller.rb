class ShowController < ApplicationController
  get '/shows/new' do
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

  get '/shows/:id' do
    @show = Show.find(params[:id])
    erb :'shows/show'
  end

  get '/shows/:id/edit' do
    @show = Show.find(params[:id])
    @tags = Helpers.current_user(session).tags
    erb :'shows/edit'
  end

  patch '/shows/:id' do
    @show = Show.find(params[:id])
    @show.update(params[:show])
    unless params[:tag][:name].empty?
      tag = Tag.create(params[:tag])
      @show.tags << tag
      @show.save
    end
    redirect "/shows/#{@show.id}"
  end
end

class ShowController < ApplicationController
  get '/shows/new' do
    erb :'shows/new'
  end

  post '/shows' do
    if params[:show][:episodes_watched] > params[:show][:episodes]
      flash[:message] = "Episodes watched cannot be greater than total episodes"
      redirect '/shows/new'
    end
    @show = Show.create(params[:show])
    @show.user = Helpers.current_user(session)
    @show.save
    redirect "/users/#{Helpers.current_user(session).slug}"
  end
end

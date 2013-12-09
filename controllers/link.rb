class BookmarkManager  < Sinatra::Application

  post '/links' do
    Link.create(url: params[:url],title: params[:title])
    redirect to('/')
  end
end
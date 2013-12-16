class BookmarkManager  < Sinatra::Application

  post '/links' do
    tags = add_tag(params['tags'])
    add_link(params[:url],params[:title],tags)
    redirect to('/')
  end

  get '/links/new' do
    haml :'links/new', layout: !request.xhr?
  end
end
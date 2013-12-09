
class BookmarkManager < Sinatra::Application

  get '/' do
  @links = Link.all
  haml :main
  end

end
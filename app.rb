require 'sinatra'
require 'sinatra/partial'
require 'haml'
require 'sinatra/flash'
require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'controllers/init'


class BookmarkManager < Sinatra::Application
  include Helpers
  include Sinatra::Flash

  enable :sessions
  set :session_secret, 'asldfugasldyguldsiuhfsuidhfaudipahsdsjhwsdjk'

end


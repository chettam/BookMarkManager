require 'sinatra'
require 'sinatra/partial'
require 'haml'
require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'controllers/init'


class BookmarkManager < Sinatra::Application
  include Helpers

end


require 'data_mapper'

env = ENV["RACK_ENV"] || 'development'
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
#DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "postgres://postgres:postgres@localhost/bookmark_manager_#{env}")

require_relative 'link' # this needs to be done after data mapper is initialised
require_relative 'tag'
require_relative 'user'
# After declaring your models, you should finalise them
DataMapper.finalize

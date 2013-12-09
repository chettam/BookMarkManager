require 'data_mapper'

env = ENV["RACK_ENV"] || 'development'
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
#DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "sqlite:#{Dir.pwd}/data/bookmarkManager_#{env}.db")

require_relative 'link' # this needs to be done after data mapper is initialised

# After declaring your models, you should finalise them
DataMapper.finalize

# However, how database tables don't exist yet. Let's tell data mapper to create them
DataMapper.auto_upgrade!
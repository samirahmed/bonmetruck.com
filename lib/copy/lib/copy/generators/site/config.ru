require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

Copy::Server.config do
  # Sets a Cache-Control header for the duration specified.
  # Heroku friendly: http://devcenter.heroku.com/articles/http-caching
  #
  set :cache_time, 300
  
  # If you're storing copy in a data store, you need a user and password
  # set to protect it. Uncomment these and enter the credentials you want
  # to use or set them as environment variables.
  # Heroku friendly: http://devcenter.heroku.com/articles/config-vars
  #
  # set :copy_username, ENV['COPY_USERNAME']
  # set :copy_password, ENV['COPY_PASSWORD']
  
  # Enter the URL to your data store.
  # Be sure to uncomment the correlating gems in your Gemfile.
  # "redis://", "mongodb://", "mysql://", "postgres://", and "sqlite://" are supported.
  # Heroku friendly: http://devcenter.heroku.com/articles/mongohq
  #
  # set :storage, ENV['MONGOHQ_URL']
end

run Copy::Server
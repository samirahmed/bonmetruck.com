require 'rubygems'
require 'bundler/setup'
require './app'
Bundler.require(:default)

Copy::Server.config do
  # Sets a Cache-Control header for the duration specified.
  # Heroku friendly: http://devcenter.heroku.com/articles/http-caching
  #
  set :cache_time, 10 
  # If you're storing copy in a data store, you need a user and password
  # set to protect it. Uncomment these and enter the credentials you want
  # to use or set them as environment variables.
  # Heroku friendly: http://devcenter.heroku.com/articles/config-vars
  #
	if ENV['COPY_USERNAME'] and ENV['COPY_PASSWORD']
  		set :copy_username, ENV['COPY_USERNAME']
  	 	set :copy_password, ENV['COPY_PASSWORD']
  		set :cache_time, 300
  	else
		set :copy_username, 'admin'
		set :copy_password, 'admin'
	end

  # Enter the URL to your data store.
  # Be sure to uncomment the correlating gems in your Gemfile.
  # "redis://", "mongodb://", "mysql://", "postgres://", and "sqlite://" are supported.
  # Heroku friendly: http://devcenter.heroku.com/articles/mongohq
  #
  # set :storage, ENV['MONGOHQ_URL']
end

run Copy::Server

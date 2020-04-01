require "sinatra"
require 'sinatra/reloader' if development?

enable :sessions

get '/' do
    if session["name"].nil?
      'Welcome!'
    else
      'Welcome back ' + session["name"]
    end
end


get '/set_name/:name' do

  # here we're assigning the parameter
  # into a session variable
  # this information then persists across
  # requests to the webservice
  # i.e. the server will maintain this information
  # specific to a single visitor / user

  session["name"] = params["name"]
  "Hello there, " + params["name"]
end


get '/unset_name' do
  session["name"] = nil
end

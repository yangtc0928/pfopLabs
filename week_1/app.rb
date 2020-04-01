require "sinatra"
require 'sinatra/reloader' if development?

enable :sessions
count = 0

get "/" do
	"Welcome back, #{session[:name]}"
end

get "/about" do
	"A little about my webservice"
end

get "/hello/:name" do
	session[:name] = params[:name]
	"Hi there, #{ params[:name] }"
end

get "/hidden" do
	403
end

get "/visits" do
	count += 1
  if session[:counter].nil?
    session[:counter] = 1
  else
    session[:counter] += 1
  end
  "Total Visits: #{count} - Client Visits: #{session[:counter]}"
end


error 403 do
	"access forbidden"
end

error 404 do
	"This resource is not available"
end

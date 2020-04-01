require "sinatra"
require 'sinatra/reloader' if development?

enable :sessions

get "/" do
	redirect to('/about'), 303
end

get "/about" do
	session["visits"] ||= 0 # Set the session to 0 if it hasn't been set before
  session["visits"] = session["visits"] + 1  # adds one to the current value (increments)
	if session["first_name"].nil?
			'Welcome! <br />This bot is at the front page of tcyang.com, and introduces TC to visitors. '
		else
			'Welcome back ' + session["first_name"] + '. <br />This bot is at the front page of tcyang.com, and introduces TC to visitors. <br />Total visits: ' + session["visits"].to_s
		end
end

get "/signup/:first_name/:number" do
	session["first_name"] = params["first_name"]
	session["number"] = params["number"]
	"first_name = " + params[:first_name] + ", number = " + session[:number]
end

get "/incoming/sms" do
	403
end

get "/test/conversation" do
	403
end

error 403 do
	'Access Denied'
end

get '/unset_name' do
  session["first_name"] = nil
	session["number"] = nil
end

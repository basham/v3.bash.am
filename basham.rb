require 'rubygems'
require 'sinatra'
require 'Djerb'

get '/' do
	@title = 'woots'
	
	Djerb.run 'views/base.erb', lambda{}
end

get '/portfolio' do
	@title = 'Daybreak'
	
	Djerb.run 'views/index.erb', lambda{}
end

get '/about' do
	@title = 'About'
	
	Djerb.run 'views/about.erb', lambda{}
end
$LOAD_PATH.unshift("~/.gem/ruby/1.8/gems") 
require 'rubygems'
require 'sinatra'

Sinatra::Application.default_options.merge!(
  :run => false,
  :env => :production
)

require 'basham.rb'
run Sinatra.application
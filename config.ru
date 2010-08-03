$LOAD_PATH.unshift('~/.gem/ruby/1.8/gems/sinatra-1.0/lib')
$LOAD_PATH.unshift('~/.gem/ruby/1.8/gems/mustache-0.11.2/lib')

require 'rubygems'
require 'sinatra'

set :environment, :production
disable :run

require 'basham'
run Basham.new
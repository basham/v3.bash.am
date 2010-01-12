# require '/home/USERNAME/.gem/ruby/1.8/gems/rack-VERSION-OF-RACK-GEM-YOU-HAVE-INSTALLELD/lib/rack.rb'
# require '/home/USERNAME/.gem/ruby/1.8/gems/sinatra-VERSION-OF-SINATRA-GEM-YOU-HAVE-INSTALLELD/lib/sinatra.rb'

$LOAD_PATH.unshift('~/.gem/ruby/1.8/gems/sinatra-0.9.4/lib') 
require 'rubygems'
require 'sinatra'

set :environment, :production
disable :run

require 'basham.rb'
run Sinatra::Application
# require '/home/USERNAME/.gem/ruby/1.8/gems/rack-VERSION-OF-RACK-GEM-YOU-HAVE-INSTALLELD/lib/rack.rb'
# require '/home/USERNAME/.gem/ruby/1.8/gems/sinatra-VERSION-OF-SINATRA-GEM-YOU-HAVE-INSTALLELD/lib/sinatra.rb'

$LOAD_PATH.unshift('~/.gem/ruby/1.8/gems') 
require 'rubygems'
require 'sinatra'

set :env, :production disable :run

require 'basham.rb'
run Sinatra.application
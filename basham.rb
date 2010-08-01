require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'
require 'lib/Array'
require 'lib/String'

class Basham < Sinatra::Base
  
  register Mustache::Sinatra
  require 'views/layout'
  require 'data/models'

  set :mustache, {
    :views => 'views/',
    :templates => 'templates/'
  }

  helpers do

    def uri()
      return request.path_info.match(/(.*)\/(.*)/).captures[1]
    end

  end

  before do
    @title = uri.capitalize
    @slug = uri
  end

  Models::STATIC.each do |path|
    get '/' + path + '/?' do
      mustache ( path == '' ? 'index' : path )
    end
  end

  Models::PROJECTS.each do |item|
    get '/portfolio/' + item.slug + '/?' do
      @item = item
      @next = Models::PROJECTS.prev( item )
      @prev = Models::PROJECTS.next( item )
      mustache :portfolio_page
    end
  end

  not_found do
  	mustache :error404
  end

end

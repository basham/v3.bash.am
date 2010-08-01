require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'
require 'lib/Array'
require 'lib/String'

class Basham < Sinatra::Base
  
  register Mustache::Sinatra
  require 'views/layout'
  require 'data/models'
  include Models

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

  STATIC.each do |path|
    get '/' + path + '/?' do
      mustache ( path == '' ? :index : path )
    end
  end

  PROJECTS.each do |project|
    get '/portfolio/' + project.slug + '/?' do
      @project = project
      @next = PROJECTS.prev( project )
      @prev = PROJECTS.next( project )
      mustache :portfolio_page
    end
  end

  not_found do
  	mustache :error404
  end

end

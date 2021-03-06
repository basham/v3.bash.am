require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'
require 'lib/Array'
require 'lib/String'

class Basham < Sinatra::Base
  
  register Mustache::Sinatra
  require 'views/plain'
  require 'views/layout'
  require 'models/models'
  include Models

  set :mustache, {
    :views => 'views/',
    :templates => 'templates/'
  }

  helpers do
    def slug
      return request.path_info.match(/(.*)\/(.*)/).captures[1]
    end
  end

  before do
    @title = slug.capitalize
    @slug = slug
  end

  STATIC.each do |path|
    get '/' + path + '/?' do
      mustache ( path.empty? ? :index : path )
    end
  end

  PLAIN.each do |path|
    get '/' + path + '/?' do
      mustache ( path, { :layout => :plain } )
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
  
  EXPERIMENTS.each do |experiment|
    get '/lab/' + experiment.slug + '/?' do
      @project = experiment
      @next = EXPERIMENTS.prev( experiment )
      @prev = EXPERIMENTS.next( experiment )
      mustache :lab_page
    end
  end

  not_found do
  	mustache :error404
  end

end

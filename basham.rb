require 'rubygems'
require 'sinatra'
require 'Djerb'

static = [ 'portfolio', 'resume', 'about', 'colophon' ]

portfolio = [
  { :title => 'Waterwall' },
  { :title => 'Daybreak' },
  { :title => 'PING Platform' } ]
  
helpers do
  
  def render( template, path = 'views', ext = '.erb' )
    template = path + '/' + template + ext
    Djerb.run template, lambda{}
  end
  
  def title( label = '' )
    title = 'Chris Basham'
    if ( label != '' )
      title = label + ' | ' + title
    end
    return title
  end
  
  def smartTitle()
    return title uri.capitalize
  end
  
  def uri()
    return request.path_info.match(/(.*)\/(.*)/).captures[1]
  end
  
  def slug( label )
    return label.downcase.gsub(' ', '-')
  end
  
end

before do
  @portfolio = portfolio
  @css = []
  @url = '/assets/css/slug/' + uri + '.css'
  if File.exists?( 'public' + @url )
    @css = [@url]
  end
  @title = smartTitle
end

get '/' do
	render 'base'
end

get '/:static' do
  param = "#{params[:static]}"
  pass if static.index(param) == nil
  render param
end

get '/portfolio/:item' do
  passed = false
  portfolio.each do |item|
    @slug = slug item[:title]
    if uri == @slug
      passed = true
      @title = title item[:title]
      break
    end
  end
  pass if !passed
  render 'portfolio/' + @slug
end

not_found do
  @title = title '404'
	render '404'
end

require 'rubygems'
require 'sinatra'
require 'Djerb'

# http://microformats.org/wiki/profile-uris
$microformatProfiles = {
  :hcalendar => 'http://microformats.org/profile/hcalendar',
  :hcard => 'http://microformats.org/profile/hcard',
  :hresume => 'http://microformats.org/profile/hresume', #Draft
  :relLicense => 'http://microformats.org/profile/rel-license',
  :relNofollow => 'http://microformats.org/profile/rel-nofollow',
  :relTag => 'http://microformats.org/profile/rel-tag',
  :voteLinks => 'http://microformats.org/profile/vote-links',
  :xFolk => 'http://microformats.org/profile/xfolk',
  :xoxo => 'http://microformats.org/profile/xoxo' }
  
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

  def tagAttr( hash )
    s = ''
    hash.each do |key, value|
      next if value == nil or value.length == 0
      if key == 'profile':
        v = []
        value.each do | p |
          v.push( $microformatProfiles[p] )
        end
        value = v
        next if value.empty?
      end
      s += ' ' + key + '="' + value.join(' ') + '"'
    end
    return s
  end
  
end

before do
  @portfolio = portfolio
  @css = ''
  @url = '/assets/css/slug/' + uri + '.css'
  if File.exists?( 'public' + @url )
    @css = @url
  end
  @title = smartTitle
end

get '/' do
	render 'base'
end

get '/:static' do
  param = "#{params[:static]}"
  pass if static.index(param) == nil
  #pass if static.include?(param)
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

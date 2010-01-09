require 'rubygems'
require 'sinatra'
require 'Djerb'

# http://microformats.org/wiki/profile-uris
$mfProfiles = {
  :hcalendar => 'http://microformats.org/profile/hcalendar',
  :hcard => 'http://microformats.org/profile/hcard',
  :hresume => 'http://microformats.org/profile/hresume', #Draft
  :relLicense => 'http://microformats.org/profile/rel-license',
  :relNofollow => 'http://microformats.org/profile/rel-nofollow',
  :relTag => 'http://microformats.org/profile/rel-tag',
  :voteLinks => 'http://microformats.org/profile/vote-links',
  :xfn => 'http://gmpg.org/xfn/11',
  :xFolk => 'http://microformats.org/profile/xfolk',
  :xoxo => 'http://microformats.org/profile/xoxo', }
  
static = [ 'portfolio', 'resume', 'about', 'colophon' ]

portfolio = [
  { :title => 'Zygomote' },
  { :title => 'Energy Safe Kids', :imgSlug => 'esk' },
  { :title => 'Waterwall',
    :summary => '<a href="http://waterwall.org">Waterwall</a> is a project that explores technology\'s place in public spaces, particularly as a tool for fostering new kinds of interac&shy;tions. It\'s an interactive art installation where the body\'s motion and presence are the main input mechanism.' },
  { :title => 'Ping Platform', :imgSlug => 'ping',
    :summary => '<a href="http://pingplatform.org">Ping</a> (Physically INteractive Gaming) is a hardware and software gaming platform intended to explore new forms of physical gestures along a tabletop surface.' },
  { :title => 'Daybreak',
    :summary => '<a href="http://daybreak.bash.am">Daybreak</a> is a collaborative design experiment with <a href="http://www.tonydewan.com/">Tony Dewan</a> as a submission to the <a href="http://www.csszengarden.com/">CSS Zen Garden</a> project. Tony produced the graphics and aesthetic of the piece, while I coded the CSS and solved technical roadblocks.' } ]
  
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
  
  def imgSlug( portfolioItem )
    return portfolioItem[:imgSlug] if portfolioItem.key?(:imgSlug)
    return slug portfolioItem[:title]
  end

  def tagAttr( hash )
    s = ''
    hash.each do |key, value|
      next if value == nil or value.length == 0
      if key == 'profile':
        v = []
        value.each do | p |
          v.push( $mfProfiles[p] )
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
  @randItem = portfolio[rand(portfolio.size)]
  @css = ''
  @url = '/assets/css/slug/' + uri + '.css'
  if File.exists?( 'public' + @url )
    @css = @url
  end
  @title = smartTitle
end

get '/' do
	render 'index'
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
      @summary = item[:summary]
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

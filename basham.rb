require 'rubygems'
require 'sinatra'
require 'lib/partials'
require 'lib/Djerb'

#use Sinatra::Partials
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
  
static = [ '', 'portfolio', 'resume', 'about', 'colophon' ]

portfolio = [
  { :title => 'Zygomote', :slug => 'zygomote' },
  { :title => 'Energy Safe Kids', :slug => 'energy-safe-kids', :imgSlug => 'esk' },
  { :title => 'Waterwall', :slug => 'waterwall',
    :summary => '<a href="http://waterwall.org">Waterwall</a> is a project that explores technology\'s place in public spaces, particularly as a tool for fostering new kinds of interac&shy;tions. It\'s an interactive art installation where the body\'s motion and presence are the main input mechanism.' },
  { :title => 'Ping Platform', :slug => 'ping-platform', :imgSlug => 'ping',
    :summary => '<a href="http://pingplatform.org">Ping</a> (Physically INteractive Gaming) is a hardware and software gaming platform intended to explore new forms of physical gestures along a tabletop surface.' },
  { :title => 'Daybreak', :slug => 'daybreak',
    :summary => '<a href="http://daybreak.bash.am">Daybreak</a> is a collaborative design experiment with <a href="http://www.tonydewan.com/">Tony Dewan</a> as a submission to the <a href="http://www.csszengarden.com/">CSS Zen Garden</a> project. Tony produced the graphics and aesthetic of the piece, while I coded the CSS and solved technical roadblocks.' } ]
  
helpers do
  include Sinatra::Partials
  
  def renderer( template, b = lambda{} )
    template = 'views/' + template + '.erb'
    Djerb.run template, b
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
  url = '/assets/css/slug/' + uri + '.css'
  @css = File.exists?( 'public' + url ) ? url : ''
  @title = smartTitle
end

static.each do |path|
  get '/' + path + '/?' do
    renderer ( path == '' ? 'index' : path )
  end
end

portfolio.each do |item|
  get '/portfolio/' + item[:slug] + '/?' do
    @title = title item[:title]
    @item = item
    @prev = portfolio.prev( item )
    @next = portfolio.next( item )
    renderer 'portfolio/' + item[:slug]
  end
end

not_found do
  @title = title '404'
	renderer '404'
end

class Array
  
  def next( el )
    return next?(el) ? self[ nextIndex(el) ] : nil
  end
  
  def next?( el )
    return nextIndex(el) != nil
  end
  
  def nextIndex( el )
    i = self.index(el)
    return i < self.length - 1 ? i + 1 : nil
  end
  
  def prev( el )
    return prev?(el) ? self[ prevIndex(el) ] : nil
  end
  
  def prev?( el )
    return prevIndex(el) != nil
  end
  
  def prevIndex( el )
    i = self.index(el)
    return i > 0 ? i - 1 : nil
  end
  
end

require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'
require 'lib/Array'
require 'lib/String'

class Basham < Sinatra::Base
  
  register Mustache::Sinatra
  require 'views/layout'

  set :mustache, {
    :views => 'views/',
    :templates => 'templates/'
  }

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
    { :title => 'Pirate Navigator', :slug => 'pirate-navigator',
      :summary => 'Pirate Navigator is a museum exhibit prototype engaging participants in 17th Century navigational techniques.' },
    { :title => 'Zygomote', :slug => 'zygomote',
      :summary => 'Zygomote is an iPhone application encouraging users to walk more regularly, as a submission to the <a href="http://www.chi2010.org/">CHI 2010</a> <a href="http://www.chi2010.org/authors/cfp-sdc.html">Student Design Competition</a>.' },
    { :title => 'Energy Safe Kids', :slug => 'energy-safe-kids', :imgSlug => 'esk',
      :summary => '<a href="http://www.vectrenenergysafe.com">Energy Safe Kids</a> is a micro-site sponsored by <a href="http://www.vectren.com">Vectren Corp</a> to promote and educate natural gas and electricity safety to elementary students.' },
    { :title => 'Waterwall', :slug => 'waterwall',
      :summary => '<a href="http://waterwall.org">Waterwall</a> is a project that explores technology\'s place in public spaces, particularly as a tool for fostering new kinds of interac&shy;tions. It\'s an interactive art installation where the body\'s motion and presence are the main input mechanism.' },
    { :title => 'Ping Platform', :slug => 'ping-platform', :imgSlug => 'ping',
      :summary => '<a href="http://pingplatform.org">Ping</a> (Physically INteractive Gaming) is a hardware and software gaming platform intended to explore new forms of physical gestures along a tabletop surface.' },
    { :title => 'Daybreak', :slug => 'daybreak',
      :summary => '<a href="http://daybreak.bash.am">Daybreak</a> is a collaborative design experiment with <a href="http://www.tonydewan.com/">Tony Dewan</a> as a submission to the <a href="http://www.csszengarden.com/">CSS Zen Garden</a> project. Tony produced the graphics and aesthetic of the piece, while I coded the CSS and solved technical roadblocks.' } ]
  
  helpers do

    def uri()
      return request.path_info.match(/(.*)\/(.*)/).captures[1]
    end

  end

  before do
    @portfolio = portfolio
    @title = uri.capitalize
    @uri = uri
  end

  static.each do |path|
    get '/' + path + '/?' do
      mustache ( path == '' ? 'index' : path )
    end
  end
  
  portfolio.each do |item|
    get '/portfolio/' + item[:slug] + '/?' do
      @item = item
      @next = portfolio.prev( item )
      @prev = portfolio.next( item )
      mustache item[:slug], :views => 'views/portfolio'
    end
  end

  not_found do
  	mustache :error404
  end

end

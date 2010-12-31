require 'models/models'

class Basham
  module Views
    class Layout < Mustache
      include Models

      attr_reader :i, :n
      attr_writer :i, :n
   
      def initialize
        @i = 0
        @n = 3
      end
      
      def passions
        PASSIONS.randomList(80)
      end

      def adjective
        ADJECTIVES.random
      end
      
      def title
        @title
      end
  
      def smartTitle
        (!defined? title) || title.empty? ? TITLE : title + ' | ' + TITLE
      end
  
      def css
        @css
      end
  
      def smartCSS
        url = '/assets/css/slug/' + ( css || @slug ) + '.css'
        File.exists?( 'public' + url ) ? url : false
      end
      
      def year
        Time.now.year
      end
  
      def formats
        mfd = Models::MF_DEFAULT
        if defined? mf then
        	mfd.concat(mf)
        end
        f = []
        for format in mfd do
          f.push( { :format => MF_PROFILES[format] } )
        end
        f
      end
  
      def bodyAttr
        body = []
        if defined? bodyClass then
        	body.concat(bodyClass)
        end
        tagAttr({ 'class' => body })
      end
  
      def tagAttr( hash )
        s = ''
        hash.each do |key, value|
          next if value == nil or value.length == 0
          if key == 'profile':
            v = []
            value.each do | p |
              v.push( MF_PROFILES[p] )
            end
            value = v
            next if value.empty?
          end
          s += ' ' + key + '="' + value.join(' ') + '"'
        end
        return s
      end
      
      def section
        @i += 1
        lambda do |text|
          a = ( @i % @n == 1 ) ? '<section class="labsec">' : ''
          b = ( @i % @n == 0 ) ? '</section>' : ''
          render(a + text + b)
        end
      end
      
    end
  end
end
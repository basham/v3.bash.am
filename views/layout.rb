require 'data/models'

class Basham
  module Views
    class Layout < Mustache

      def passions
        Models::PASSIONS.randomList(64)
      end

      def adjective
        Models::ADJECTIVES.random
      end
      
      def title
        @title
      end
  
      def smartTitle
        (!defined? title) || title.empty? ? Models::TITLE : title + ' | ' + Models::TITLE
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
          f.push( { :format => Models::MF_PROFILES[format] } )
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
              v.push( Models::MF_PROFILES[p] )
            end
            value = v
            next if value.empty?
          end
          s += ' ' + key + '="' + value.join(' ') + '"'
        end
        return s
      end
      
    end
  end
end
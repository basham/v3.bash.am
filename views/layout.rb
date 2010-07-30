class Basham
  module Views
    class Layout < Mustache

      def passions
        p = [
        	'prototyping',
        	'<abbr title="Do it yourself">DIY</abbr>',
        	'sketching',
        	'grammar',
        	'blueberry muffins',
        	'God',
        	'church',
        	'graphic novels',
        	'sci-fi',
        	'disc golf',
        	'Ultimate',
        	'running barefoot',
        	'audiobooks',
        	'paper craft',
        	'sand volleyball',
        	'Settlers of Catan',
        	'movies']
        p.randomList(64)
      end

      def adjective
        adjectives = [
        	'intelligent',
        	'radical',
        	'curious',
        	'awkward',
        	'impossible',
        	'extraordinary',
        	'fantastic',
        	'ridiculous',
        	'creative',
        	'clever',
        	'intriguing',
        	'absurd',
        	'marvelous',
        	'irrational',
        	'inconceivable',
        	'unpredictable',
        	'pleasant']
        adjectives.random
      end
      
      def title
        @title || 'wootsyeah'
      end
  
      def css
        @css || ''
      end
  
      def year
        Time.now.year
      end
  
      def formats
        mfs = [:hcard, :relLicense, :xfn]
        if defined? mf then
        	mfs.concat(mf)
        end
        f = []
        for format in mfs do
          f.push( { :format => $mfProfiles[format] } )
        end
        return f
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
  end
end
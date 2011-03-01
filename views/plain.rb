class Basham
  module Views
    class Plain < Mustache
      
      def title
        @title
      end
  
      def smartTitle
        title || ''
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
      
    end
  end
end
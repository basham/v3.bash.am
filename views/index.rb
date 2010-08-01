require 'models/models'

class Basham
  module Views
    class Index < Layout
  
      def scripts
          #js = []
          #js.push({ :script => '/assets/js/jquery.jtwitter.js' })
          #js.push({ :script => '/assets/js/jquery.twitterize.js' })
      end
    
      def featured
        Models::PROJECTS.random
      end

    end
  end
end
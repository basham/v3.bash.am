class Basham
  module Views
    class Index < Layout
  
      def scripts
          #js = []
          #js.push({ :script => '/assets/js/jquery.jtwitter.js' })
          #js.push({ :script => '/assets/js/jquery.twitterize.js' })
      end
    
      def featured
        @portfolio.random
      end

    end
  end
end
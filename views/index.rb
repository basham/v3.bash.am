require 'models/models'

class Basham
  module Views
    class Index < Layout
  
      def scripts
          #js = []
          #js.push({ :script => '/assets/js/jquery.jtwitter.js' })
          #js.push({ :script => '/assets/js/jquery.twitterize.js' })
      end
    
      def featuredProjects
        Models::PROJECTS.random
      end
      
      def featuredExperiments
        Models::EXPERIMENTS.randomCollection(3)
      end

    end
  end
end
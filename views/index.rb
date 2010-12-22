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
      
      # Acquire three uniquely random lab experiments
      def featuredExperiments
        [ Models::EXPERIMENTS.random(true), Models::EXPERIMENTS.random(true), Models::EXPERIMENTS.random(true) ]
      end

    end
  end
end
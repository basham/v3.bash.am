require 'models/models'

class Basham
  module Views
    class Portfolio < Layout
   
      def portfolio
        Models::PROJECTS
      end
      
    end
  end
end
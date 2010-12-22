require 'models/models'

class Basham
  module Views
    class Lab < Layout
   
      def lab
        Models::EXPERIMENTS
      end
      
    end
  end
end
class Basham
  module Views
    class LabPage < Layout
      
      def initialize
        #self.class.path = 'templates/lab/'
      end

      def title
        @project.title
      end

      def summary
        @project.summary
      end
      
      def slug
        @project.slug
      end
      
      # Dynamically sets the partial to the appropriate portfolio project
      def project
        lambda { |text| render( '{{> lab/' + slug + '}}' ) }
      end

      def prev
        @prev
      end
      
      def next
        @next
      end
      
    end
  end
end
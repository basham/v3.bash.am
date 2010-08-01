class Basham
  module Views
    class PortfolioPage < Layout
      
      def initialize
        self.class.path = 'templates/portfolio/'
      end

      def title
        @item.title
      end

      def summary
        @item.summary
      end
      
      def slug
        @item.slug
      end
      
      # Dynamically sets the partial to the appropriate portfolio project
      def project
        lambda { |text| render( '{{> ' + slug + '}}' ) }
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
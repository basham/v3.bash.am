class Basham
  module Views
    class PortfolioPage < Layout

      def initialize
        self.class.path = 'templates/portfolio/'
      end

      def title
        @item[:title]
      end

      def summary
        @item[:summary]
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
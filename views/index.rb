class Basham
  module Views
    class Index < Layout
  
      def title
        'hazzah'
      end

      def scripts
          js = []
          js.push({ :script => '/assets/js/jquery.jtwitter.js' })
          js.push({ :script => '/assets/js/jquery.twitterize.js' })
      end

      def slug( label )
        return label.downcase.gsub(' ', '-')
      end
    
      def featured
        { :title => @featuredItem[:title], :slug => slug(@featuredItem[:title]), :summary => @featuredItem[:summary] }
      end

    end
  end
end
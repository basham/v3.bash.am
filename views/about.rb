class Basham
  module Views
    class About < Layout
   
      def bodyClass
        [ ('a'..'c').to_a.random ]
      end
      
    end
  end
end
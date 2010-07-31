class Basham
  module Views
    class Resume < Layout
   
      def bodyClass
        [ 'hresume' ]
      end
      
      def mf
        [ :hresume, :hcalendar, :relTag ]
      end
      
    end
  end
end
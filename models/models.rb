class Basham
  module Models
    
    class Project

      attr_reader :title, :summary
      attr_writer :title, :summary

      def initialize( title, summary )
        @title = title || ''
        @summary = summary || ''
      end

      def slug
        @title.toSlug
      end
  
    end
    
    PROJECTS = [
      Project.new( 'Pirate Navigator', 'Pirate Navigator is a museum exhibit prototype, engaging participants in 17th Century navigational techniques.' ),
      Project.new( 'Zygomote', 'Zygomote is an iPhone application encouraging users to walk more regularly, as a submission to the <a href="http://www.chi2010.org/">CHI 2010</a> <a href="http://www.chi2010.org/authors/cfp-sdc.html">Student Design Competition</a>.' ),
      Project.new( 'Energy Safe Kids', '<a href="http://www.vectrenenergysafe.com">Energy Safe Kids</a> is a micro-site sponsored by <a href="http://www.vectren.com">Vectren Corp</a> to promote and educate natural gas and electricity safety to elementary students.' ),
      Project.new( 'Waterwall', '<a href="http://waterwall.org">Waterwall</a> is a project that explores technology\'s place in public spaces, particularly as a tool for fostering new kinds of interactions. It\'s an interactive art installation where the body\'s motion and presence are the main input mechanism.' ),
      Project.new( 'Ping Platform', '<a href="http://pingplatform.org">Ping</a> (Physically INteractive Gaming) is a hardware and software gaming platform intended to explore new forms of physical gestures along a tabletop surface.' ) ]

    EXPERIMENTS = [
      Project.new( 'Pirate boat', 'Exploration into prototyping form with florist foam.' ),
      Project.new( 'Keynote SLAM', 'Interactive prototyping with Keynote.' ),
      Project.new( 'Pencil sharpener sketch', 'Experimentation of industrial sketching techniques.' ),
      Project.new( 'Bronze Viper Mark II', 'Modeling a <abbr title="Battlestar Galactica">BSG</abbr> space fighter in bronze.' ),
      Project.new( 'Daybreak', 'Submission to the <a href="http://www.csszengarden.com/">CSS Zen Garden</a> project.' ) ]
      #Project.new( 'IR Wind Chime', '...' ),
      #Project.new( 'Cricket bat v2', '...' ),
      #Project.new( 'Cricket bat v1', '...' ),
      #Project.new( 'Sketchbook closure', '...' ),
      #Project.new( 'Laser tag Arduino', '...' ),
      #Project.new( 'Conductive gloves', '...' ) ]
    
    STATIC = [ '', 'portfolio', 'lab', 'resume', 'about', 'colophon' ]

    PLAIN = [ 'inventables' ]
      
    # http://microformats.org/wiki/profile-uris
    MF_PROFILES = {
      :hcalendar => 'http://microformats.org/profile/hcalendar',
      :hcard => 'http://microformats.org/profile/hcard',
      :hresume => 'http://microformats.org/profile/hresume', #Draft
      :relLicense => 'http://microformats.org/profile/rel-license',
      :relNofollow => 'http://microformats.org/profile/rel-nofollow',
      :relTag => 'http://microformats.org/profile/rel-tag',
      :voteLinks => 'http://microformats.org/profile/vote-links',
      :xfn => 'http://gmpg.org/xfn/11',
      :xFolk => 'http://microformats.org/profile/xfolk',
      :xoxo => 'http://microformats.org/profile/xoxo', }
    
    MF_DEFAULT = [ :hcard, :relLicense, :xfn ]
    
    PASSIONS = [
    	'prototyping',
    	'<abbr title="Do it yourself">DIY</abbr>',
    	'sketching',
    	'grammar',
    	'word&shy;smithing',
    	'blueberry muffins',
    	'graphic novels',
    	'sci-fi',
    	'disc golf',
    	'Ultimate',
    	'running barefoot',
    	'audio&shy;books',
    	'paper craft',
    	'sand volleyball',
    	'Settlers of Catan',
    	'movies',
    	'pens',
    	'mind mapping']
    
    PASSIONS_MAX_CHARS = 75
    
  	ADJECTIVES = [
    	'intelligent',
    	'radical',
    	'curious',
    	'awkward',
    	'impossible',
    	'extraordinary',
    	'fantastic',
    	'ridiculous',
    	'creative',
    	'clever',
    	'intriguing',
    	'absurd',
    	'marvelous',
    	'irrational',
    	'inconceivable',
    	'unpredictable',
    	'pleasant']
    
    TITLE = 'Chris Basham'
    
  end
end
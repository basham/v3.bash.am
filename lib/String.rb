class String
  
  def stripMarkup
    self.gsub(/<\/?[^>]*>/, '')
  end
  
end
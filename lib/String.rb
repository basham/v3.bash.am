class String
  
  def stripMarkup
    self.gsub(/<\/?[^>]*>/, '')
  end
  
  def toSlug
    self.downcase.gsub(/\s/, '-')
  end
  
end
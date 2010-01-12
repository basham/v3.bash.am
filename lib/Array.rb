class Array
  
  def next( el )
    return next?(el) ? self[ nextIndex(el) ] : nil
  end
  
  def next?( el )
    return nextIndex(el) != nil
  end
  
  def nextIndex( el )
    i = self.index(el)
    return i < self.length - 1 ? i + 1 : nil
  end
  
  def prev( el )
    return prev?(el) ? self[ prevIndex(el) ] : nil
  end
  
  def prev?( el )
    return prevIndex(el) != nil
  end
  
  def prevIndex( el )
    i = self.index(el)
    return i > 0 ? i - 1 : nil
  end
  
end
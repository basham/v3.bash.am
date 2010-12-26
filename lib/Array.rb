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
  
  def random( remove = false )
    r = rand(self.length)
    return remove ? self.delete_at(r) : self[r]
  end
  
  def randomCollection( n = 0 )
    i = 0
    a = []
    f = (0...self.size).to_a # Array of self's indexes
    n = n > f.length || n == 0 ? f.length : n
    
    while i < n
      a.push( self[ f.random(true) ] ) # Randomly retrieve an el and remove potential to be retrieved again
      i += 1
    end
    
    return a
  end
  
  def randomList( maxChars = 100 )
    sum = 0
    r = self.randomCollection
    a = []
    delimiter = ', '
    conjunction = ' and '

    maxChars -= conjunction.length

    while r.length > 0 # Stop when possibles end
      el = r.pop # Retrieve a randomized el and remove potential to be retrieved again
      if sum + el.stripMarkup.length < maxChars # Tests if new el is within char limit
        sum += el.stripMarkup.length
        maxChars -= delimiter.length
        a.push( el )
      end
    end
    
    if a.length <= 1
      return a.to_s
    end
    
    last = a.pop
    return a.join( delimiter ) + conjunction + last
  end
  
end
class Helper


  def self.fix_url( url )
    if url.start_with?("http://") 
      return url
    elsif url == ""
      return nil
    else 
      return "http://" + url
    end  
  end

  def self.find_child( path )

    case path
    when "/tags"
      return 1
    when "/payees"
      return 2
    when "/transactions"
      return 3
    when "/budets"
      return 4  
    when "/tags/new"
      return 5
    when "/payees/new"
      return 6
    when "/transactions/new"
      return 7
    when "/budgets/new"
    end

  end

  def self.to_2dp( number )
    return sprintf('%.2f', number)
  end

  def self.totaller( collection, value_method )
    total = 0
    collection.each do |object|
      total += object.send( value_method )
    end
    return total
  end

  def self.total_to_2dp( collection, value_method )
    total = Helper.totaller( collection, value_method )
    return Helper.to_2dp( total )
  end

  def self.get_bar_css( part, total )

    percentage = (part.to_f) / (total.to_f)
    bar_height =  200 * percentage
    bar_height = 200 if bar_height > 200
    css_add = ""
    css = "height: #{bar_height}px;"
    css_add = "background-color: orange;" if percentage >= 0.66
    css_add = "background-color: red;" if percentage >= 0.80

    return css + css_add
    
  end

   

  

end
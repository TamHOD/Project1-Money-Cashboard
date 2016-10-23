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
    when "/tags/new"
      return 4
    when "/payees/new"
      return 5
    when "/transactions/new"
      return 6
    end
    
  end

end
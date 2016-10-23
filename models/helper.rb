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


end
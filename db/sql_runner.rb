require 'pg'
require 'uri'
class SqlRunner

  def self.run( sql )

    if ENV['DATABASE_URL'] == nil
      uri = URI.parse("http://localhost/money_cashboard")
    else
      uri = URI.parse(ENV['DATABASE_URL'])    
    end
    
    begin
      db = PG.connect( dbname: uri.path[1..-1], host: uri.host, user: uri.user, password: uri.password)
      result = db.exec ( sql )

    ensure
      db.close

    end

    return result


  end


end
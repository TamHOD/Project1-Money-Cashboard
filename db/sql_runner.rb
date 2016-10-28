require 'pg'
class SqlRunner

  def self.run( sql )

    begin
      db = PG.connect( dbname: 'd8q2cn0mhs8jll', host: 'ec2-54-228-214-47.eu-west-1.compute.amazonaws.com')
    
      result = db.exec ( sql )

    ensure
      db.close

    end

    return result


  end


end
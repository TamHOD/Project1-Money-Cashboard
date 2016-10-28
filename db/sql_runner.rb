require 'pg'
require 'uri'
class SqlRunner

  def self.run( sql )

    uri = URI.parse(ENV['DATABASE_URL'])
    puts uri

    begin
      db = PG.connect( dbname: 'd8q2cn0mhs8jll', host: 'ec2-54-228-214-47.eu-west-1.compute.amazonaws.com', user: 'bupxdrnxajhdvt', password: 'MGwsRC9Z9FqP9QiDQmcxbUQBQb')
      puts db.methods
      result = db.exec ( sql )

    ensure
      db.close

    end

    return result


  end


end


class Payee

  attr_reader :id, :name, :website

  def initialize( params )
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @website = Helper.fix_url( params['website'] )
  end

  def save
    sql = "INSERT into payees(
        name,
        website
      )
      VALUES(
        '#{@name}',
        '#{@website}'
      )
      RETURNING *
      "
    payee = Payee.map_item( sql ) 
    @id = payee.id.to_i
  end

  def self.update( params )
    sql = "UPDATE payees SET
      name = '#{params['name']}',
      website = '#{params['website']}',
    WHERE 
      id = #{params['id']}"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM payees WHERE id = #{id}"
    return map_item( sql )
  end

  def self.all 
    sql = "SELECT * from payees"
    return Payee.map_items( sql )
  end

  def self.map_items( sql )
    results_data = SqlRunner.run( sql )
    return results_data.map {|result| Payee.new( result )}
  end

  def self.map_item( sql )
    return Payee.map_items( sql ).first
  end

  def self.delete_all
    sql = "DELETE from payees"
    SqlRunner.run( sql )
  end

  def self.delete( id )
    sql = "DELETE FROM payees
            WHERE id = #{id}"
    SqlRunner.run( sql )
  end

end
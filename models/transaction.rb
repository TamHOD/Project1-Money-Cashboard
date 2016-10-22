require_relative '../db/sql_runner'

class Transaction

  attr_reader :id, :payee_id, :amount

  def initialize( params )
    @id = params['id'].to_i if params['id']
    @amount = params['amount'].to_f
    @payee_id = params['payee_id'].to_i

  end

  def save
    sql = "INSERT into transactions(
        payee_id,
        amount
      )
      VALUES(
        #{@payee_id},
        #{@amount}
      )
      RETURNING *
      "
    transaction = Transaction.map_item( sql ) 
    @id = transaction.id.to_i
  end

  def self.find( id )
    sql = "SELECT * FROM transactions WHERE id = #{id}"
    return map_item( sql )
  end

  def self.all 
    sql = "SELECT * from transactions"
    return Transaction.map_items( sql )
  end

  def self.map_items( sql )
    results_data = SqlRunner.run( sql )
    return results_data.map {|result| Transaction.new( result )}
  end

  def self.map_item( sql )
    return Transaction.map_items( sql ).first
  end

  def self.delete_all
    sql = "DELETE from transactions"
    SqlRunner.run( sql )
  end



end
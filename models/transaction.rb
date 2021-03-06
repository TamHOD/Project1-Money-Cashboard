require_relative '../db/sql_runner'
require_relative './payee'

class Transaction

  attr_reader :id, :payee_id, :amount, :budget_id

  def initialize( params )
    @id = params['id'].to_i if params['id']
    @amount = params['amount'].to_f
    @payee_id = params['payee_id'].to_i
    @budget_id = params['budget_id'].to_i

  end

  def save
    sql = "INSERT into transactions(
        payee_id,
        amount,
        budget_id
      )
      VALUES(
        #{@payee_id},
        #{@amount},
        #{@budget_id}
      )
      RETURNING *
      "
    transaction = Transaction.map_item( sql ) 
    @id = transaction.id.to_i
    return transaction
  end

  def tags
    sql = "SELECT tags.* FROM tags
            INNER JOIN taggings 
              ON tags.id = taggings.tag_id
                INNER JOIN transactions
                  ON taggings.transaction_id = transactions.id
                    WHERE transactions.id = #{@id}"
    return Tag.map_items( sql )
  end

  def budget
    sql = "SELECT budgets.* FROM budgets
            INNER JOIN transactions 
              ON transactions.budget_id = budgets.id
                WHERE budgets.id = #{@budget_id}"
    return Budget.map_item( sql )
  end


  def amount_2f_s
    return sprintf('%.2f', @amount)
  end

  def payee
    sql = "SELECT p.* FROM payees p
            INNER JOIN transactions t ON 
              p.id = t.payee_id
            WHERE 
              p.id = #{@payee_id}"
    return Payee.map_item( sql )
  end

  def self.update( params )
    sql = "UPDATE transactions SET
      amount = #{params['amount']},
      payee_id = #{params['payee_id']},
      budget_id = #{params['budget_id']}
    WHERE 
      id = #{params['id']}"
    SqlRunner.run( sql )
  end

  def has_tag?( tag_id )
    tags.each do |tag|
      return true if tag_id == tag.id
    end
    return false
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

  def self.total
    sql = "SELECT sum(amount) FROM transactions"
    return SqlRunner.run( sql ).first['sum']
  end

  def self.delete( id )
    sql = "DELETE from transactions WHERE id = #{id}"
    SqlRunner.run( sql )

  end

end